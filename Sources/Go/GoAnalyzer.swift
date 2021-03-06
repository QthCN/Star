//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/15.
//

import Foundation
import Common

let ignoreDirs = ["vender", "node_modules", ".git"]

public class GoAnalyzer: Analyzer {
    var fs: FileSystem! = nil
    var config: Configuration = Configuration()
    let queue = DispatchQueue(label: "star.goanalyzer", qos: .userInteractive, attributes: .concurrent)
    private var sem = DispatchSemaphore(value: 0)
    
    /// 分析结果
    // package列表 key为import路径
    var packages: [String:GoPackage] = [:]
    // package列表，key为package目录路径
    var fsPackages: [String:GoPackage] = [:]
    // GoMod文件
    var goMod: GoMod?
    // module前缀
    var modulePrefix: String = ""
    
    // 清理分析结果
    func reset() {
        self.packages = [:]
        self.fsPackages = [:]
    }
    
    public init() {}
    
    public func cu(fs: FileSystemObject) -> CompilationUnion? {
        if let pkg = self.fsPackages[fs.objPath()] {
            return pkg.getFile(name: fs.objName())
        } else {
            return nil
        }
    }
    
    public func listPackages() -> [String:GoPackage] {
        return self.packages
    }
    
    public func analysis(fs: FileSystem, config: Configuration) {
        self.fs = fs
        self.config = config
        self.reset()
        self.analysis()
        print("go analysis finished, modulePrefix \(self.modulePrefix), packages(by fs): \(self.fsPackages.keys)")
    }
    
    func isGoProject() -> Bool {
        // 搜索三层目录看是否有go结尾的文件或go.mod，有的话就认为是go的项目
        let topDirItems = self.fs.listItems(path: FileSystemObject())
        for topDirItem in topDirItems {
            if !topDirItem.dir() && (topDirItem.objName().hasSuffix(".go") || topDirItem.objName() == "go.mod") {
                return true
            }
            
            if topDirItem.dir() {
                let subDirItems = self.fs.listItems(path: topDirItem)
                for subDirItem in subDirItems {
                    if !subDirItem.dir() && (subDirItem.objName().hasSuffix(".go") || subDirItem.objName() == "go.mod") {
                        return true
                    }
                }
                
                for subDirItem in subDirItems {
                    if subDirItem.dir() {
                        let subSubDirItems = self.fs.listItems(path: subDirItem)
                        for subSubDirItem in subSubDirItems {
                            if !subSubDirItem.dir() && (subSubDirItem.objName().hasSuffix(".go") || subSubDirItem.objName() == "go.mod") {
                                return true
                            }
                        }
                    }
                }
            }
        }
        
        return false
    }
    
    func getPackageByPath(p: String) -> GoPackage? {
        return self.packages[p]
    }
    
    func getPackageByName(n: String) -> GoPackage? {
        for (_, pkg) in self.packages {
            if pkg.name == n {
                return pkg
            }
        }
        return nil
    }
    
    func analysis() {
        // 判断是否是一个go的项目
        if !self.isGoProject() {
            return
        }
        
        // 判断是否存在go.mod
        if let goModFile = self.fs.listItemsByName(path: FileSystemObject(), name: "go.mod") {
            if let content = self.fs.getFileContent(item: goModFile) {
                self.goMod = GoMod(f: goModFile, c: content)
                self.modulePrefix = self.goMod?.module() ?? ""
            }
        }
        
        // 生成package信息
        self.analysisPackages(FileSystemObject())
        self.analysisPackageDirs()
        
        // 生成import依赖图
        self.analysisImportDependGraph()
        
        // 生成type definition信息
        self.analysisTypeInfo()
        
        // 生成expr的type和identifier的resolve信息
        self.analysisSymbolInfo()
    }
    
    private func analysisImportDependGraph() {
        for (_, pkg) in self.packages {
            for importPath in pkg.imports {
                if let importPkg = self.packages[importPath] {
                    pkg.depPackages.append(importPkg)
                }
            }
        }
    }
    
    private var toAnalysisDir: [FileSystemObject] = []
    
    private func analysisPackages(_ dir: FileSystemObject) {
        print("analysis \(dir.objName())")
        self.toAnalysisDir.append(dir)
        
        // 分析子目录中的package
        let subDirItems = self.fs.listItems(path: dir)
        for subDirItem in subDirItems {
            if !subDirItem.dir() || ignoreDirs.contains(subDirItem.objName()) {
                continue
            }
            
            self.analysisPackages(subDirItem)
        }
        
    }
    
    private let lock = NSLock()
    
    private func analysisPackageDirs() {
        sem = DispatchSemaphore(value: 0)
        var workers: [Thread] = []
        
        var handled_pkgs_num = 0
        
        while handled_pkgs_num < self.toAnalysisDir.count {
            var i = 0
            while i < self.config.thread_num {
                let target_id = i + handled_pkgs_num
                
                if target_id >= self.toAnalysisDir.count {
                    break
                }
                
                let worker = Thread(target: self, selector: #selector(doAnalysisPackage), object: nil)
                workers.append(worker)
                worker.name = "\(target_id)"
                worker.stackSize = 16 * 1024 * 1024
                worker.start()
                
                i += 1
            }
            handled_pkgs_num += i
            
            for _ in workers {
                sem.wait()
            }
            workers = []
        }
        
        self.toAnalysisDir = []
    }
    
    @objc private  func doAnalysisPackage() {
        let threadName = Int(Thread.current.name!)!
        let dir = self.toAnalysisDir[threadName]
        print("analysis package \(dir)")
        let package = GoPackage(analyzer: self)
        // 分析这个package
        self.analysisPackage(dir, package)
        
        // 判断package是否有效
        if package.valid() {
            var p = "\(self.modulePrefix)/\(dir.rpath())"
            if self.modulePrefix == "" {
                p = dir.rpath()
            }
            if p.hasSuffix("/") {
                p = self.modulePrefix
            }
            package.path = dir.rpath()
            
            lock.lock()
            self.fsPackages[dir.rpath()] = package
            self.packages[p] = package
            lock.unlock()
        }
        
        sem.signal()
    }
    
    private func analysisPackage(_ directory: FileSystemObject, _ package: GoPackage) {
        let dirItems = self.fs.listItems(path: directory)
        // 设置同一个package下的parser共用同一个scope
        let parser = GoParser()
        parser.scope = package.scope
        for dirItem in dirItems {
            if dirItem.dir() || !dirItem.objName().hasSuffix(".go") {
                continue
            }
            
            // TODO 暂时忽略测试文件
            if dirItem.objName().hasSuffix("_test.go") {
                continue
            }
            
            if let content = self.fs.getFileContent(item: dirItem) {
                let cu = parser.parse(content: content)
                if cu.getAST() != nil {
                    package.addFile(name: dirItem.objName(), cu: cu, fileObj: dirItem)
                    
                    if package.name == "" {
                        if let package_identifier = cu.getAST()?.find(t: goast_package_identifier.self) {
                            package.setName(name: cu.codes(pos: package_identifier.pos))
                        }
                    }
                    
                    // 对文件进行decl分析
                    let declVisiter = GoDeclVisiter(cu: cu, pkg: package, pkgScope: package.scope, fileObject: dirItem)
                    declVisiter.visit_ast(cu.getAST()! as! GoAST)
                }
            }
            
        }
    }
    
    private func isPkgCanDoTypeInfoAnalysis(pkg: GoPackage) -> Bool {
        if pkg.typeInfoAnalysised == true {
            return false
        }
        
        if pkg.depPackages.count == 0 {
            return true
        }
        
        for dp in pkg.depPackages {
            if dp.typeInfoAnalysised == false {
                return false
            }
        }
        
        return true
    }
    
    private func isPkgCanDoSymbolInfoAnalysis(pkg: GoPackage) -> Bool {
        if pkg.exprResolverAnalysised == true {
            return false
        }
        
        if pkg.depPackages.count == 0 {
            return true
        }
        
        for dp in pkg.depPackages {
            if dp.exprResolverAnalysised == false {
                return false
            }
        }
        
        return true
    }
    
    @objc private  func analysisTypeInfoOnPkg() {
        let threadName = Int(Thread.current.name!)!
        let pkg = self.analysisTypeInfoPkgs[threadName]
        print("analysis package type info \(pkg)")
        for (path, cu) in pkg.files {
            let typeVisiter = GoTypeVisiter(cu: cu, pkg: pkg, file: pkg.fileObjs[path]!)
            typeVisiter.visit_ast(cu.getAST()! as! GoAST)
        }
        sem.signal()
    }
    
    @objc private  func analysisSymbolInfoOnPkg() {
        let threadName = Int(Thread.current.name!)!
        let pkg = self.analysisSymbolInfoPkgs[threadName]
        print("analysis package symbol info \(pkg)")
        for (path, cu) in pkg.files {
            let exprVisiter = GoExprVisiter(cu: cu, pkg: pkg, file: pkg.fileObjs[path]!)
            exprVisiter.visit_ast(cu.getAST()! as! GoAST)
        }
        sem.signal()
    }
    
    
    private var analysisSymbolInfoPkgs: [GoPackage] = []
    
    private func analysisSymbolInfo() {
        // 从底层package开始从下往上处理。每次处理时从package中挑选 没有depPackage的 或者 所有的depPackage都已经被处理 的package进行处理
        var pkgs: [GoPackage] = []
        while true {
            // 执行分析
            sem = DispatchSemaphore(value: 0)
            var workers: [Thread] = []
            self.analysisSymbolInfoPkgs = pkgs
            var handled_pkgs_num = 0
            
            while handled_pkgs_num < self.analysisSymbolInfoPkgs.count {
                var i = 0
                while i < self.config.thread_num {
                    let target_id = i + handled_pkgs_num
                    
                    if target_id >= self.analysisSymbolInfoPkgs.count {
                        break
                    }
                    
                    let worker = Thread(target: self, selector: #selector(analysisSymbolInfoOnPkg), object: nil)
                    workers.append(worker)
                    worker.name = "\(target_id)"
                    worker.stackSize = 16 * 1024 * 1024
                    worker.start()
                    
                    i += 1
                }
                handled_pkgs_num += i
                
                for _ in workers {
                    sem.wait()
                }
                workers = []
            }
            
            self.analysisSymbolInfoPkgs = []
            
            // 标记为已经分析
            for pkg in pkgs {
                pkg.exprResolverAnalysised = true
            }
            
            pkgs = []
            
            // 获取下一批
            for (_, pkg) in self.packages {
                if isPkgCanDoSymbolInfoAnalysis(pkg: pkg) {
                    pkgs.append(pkg)
                }
            }
            
            if pkgs.count == 0 {
                break
            }
        }
    }
    
    private var analysisTypeInfoPkgs: [GoPackage] = []
    
    private func analysisTypeInfo() {
        var pkgs: [GoPackage] = []
        while true {
            // 执行分析
            sem = DispatchSemaphore(value: 0)
            var workers: [Thread] = []
            self.analysisTypeInfoPkgs = pkgs
            
            var handled_pkgs_num = 0
            
            while handled_pkgs_num < self.analysisTypeInfoPkgs.count {
                var i = 0
                while i < self.config.thread_num {
                    let target_id = i + handled_pkgs_num
                    
                    if target_id >= self.analysisTypeInfoPkgs.count {
                        break
                    }
                    
                    let worker = Thread(target: self, selector: #selector(analysisTypeInfoOnPkg), object: nil)
                    workers.append(worker)
                    worker.name = "\(target_id)"
                    worker.stackSize = 16 * 1024 * 1024
                    worker.start()
                    
                    i += 1
                }
                handled_pkgs_num += i
                
                for _ in workers {
                    sem.wait()
                }
                workers = []
            }
            
            self.analysisTypeInfoPkgs = []

            // 标记为已经分析
            for pkg in pkgs {
                pkg.typeInfoAnalysised = true
            }
            
            pkgs = []
            
            // 获取下一批
            for (_, pkg) in self.packages {
                if isPkgCanDoTypeInfoAnalysis(pkg: pkg) {
                    pkgs.append(pkg)
                }
            }
            
            if pkgs.count == 0 {
                break
            }
        }
    }
    
    
    public func symbolInfo(cu: CompilationUnion, offset: Int) -> SymbolInfo? {
        guard let node = cu.getAST()?.find(offset: offset) else {
            return nil
        }
        
        let symbolInfo = SymbolInfo()
        symbolInfo.cu = cu
        symbolInfo.content = cu.codes(pos: node.pos)
        symbolInfo.node = node
        
        // 获取type信息
        if let expr = node as? UASTExpr {
            symbolInfo.type = expr.getType()
        }
        
        // 获取decl信息
        if let ident = node as? UASTIdentifier {
            symbolInfo.declarations = ident.listDeclarations()
        }
        
        // 获取动作类型
        // CallGraph
        if self.ifSymbolSupportCallGraph(symbol: symbolInfo) {
            symbolInfo.actions.append(.callGraph)
        }
        
        return symbolInfo
    }
    
    private func ifSymbolSupportCallGraph(symbol: SymbolInfo) -> Bool {
        guard let node = symbol.node else { return false }
        guard node is goast_identifier || node is goast_field_identifier else { return false }
        if node.parent is goast_method_declaration {
            let parentNode = node.parent as! goast_method_declaration
            if parentNode.name === node {
                return true
            } else {
                return false
            }
        } else if node.parent is goast_function_declaration {
            let parentNode = node.parent as! goast_function_declaration
            if parentNode.name === node {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    private func ifSymbolSupportTypeDetail(symbol: SymbolInfo) -> Bool {
        return true
    }
    
    public func callGraph(symbol: SymbolInfo) -> CGCaller? {
        guard let cu = symbol.cu else { return nil }
        guard let node = symbol.node else { return nil }
        print("callGraph: ", type(of: node), type(of: node.parent!))
        
        if let methodDeclNode = node.parent as? goast_method_declaration {
            return GenCallGraph_goast_method_declaration(cu: cu, node: methodDeclNode)
        } else if let funcDeclNode = node.parent as? goast_function_declaration {
            return GenCallGraph_goast_function_declaration(cu: cu, node: funcDeclNode)
        } else {
            return nil
        }
    }
    
    public func structure(cu: CompilationUnion) -> [Structure] {
        
        guard let ast = cu.getAST() as? goast_source_file else {return []}
        
        return ast2structure(cu: cu, ast: ast)
    }
    
}
