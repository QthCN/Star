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
    
    /// 分析结果
    // package列表 key为路径
    var packages: [String:GoPackage] = [:]
    // GoMod文件
    var goMod: GoMod?
    // module前缀
    var modulePrefix: String = ""
    
    // 清理分析结果
    func reset() {
        self.packages = [:]
    }
    
    public init() {}
    
    public func listPackages() -> [String:GoPackage] {
        return self.packages
    }
    
    public func analysis(fs: FileSystem, config: Configuration) {
        self.fs = fs
        self.config = config
        self.reset()
        self.analysis()
    }
    
    func isGoProject() -> Bool {
        // 搜索两层目录看是否有go结尾的文件，有的话就认为是go的项目
        let topDirItems = self.fs.listItems(path: FileSystemObject())
        for topDirItem in topDirItems {
            if !topDirItem.dir() && topDirItem.objName().hasSuffix(".go") {
                return true
            }
            
            if topDirItem.dir() {
                let subDirItems = self.fs.listItems(path: topDirItem)
                for subDirItem in subDirItems {
                    if !subDirItem.dir() && subDirItem.objName().hasSuffix(".go") {
                        return true
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
        
        // 生成import依赖图
        self.analysisImportDependGraph()
        
        // 生成type definition信息
        self.analysisTypeInfo()
        
        // 生成expr的type和identifier的resolve信息
        self.analysisSymbolInfo()
    }
    
    func analysisImportDependGraph() {
        for (_, pkg) in self.packages {
            for importPath in pkg.imports {
                if let importPkg = self.packages[importPath] {
                    pkg.depPackages.append(importPkg)
                }
            }
        }
    }
    
    func analysisPackages(_ dir: FileSystemObject) {
        let package = GoPackage(analyzer: self)
        // 分析这个package
        self.analysisPackage(dir, package)
        
        
        // 判断package是否有效
        if package.valid() {
            var p = "\(self.modulePrefix)/\(dir.rpath())"
            if p.hasSuffix("/") {
                p = self.modulePrefix
            }
            self.packages[p] = package
            package.path = dir.rpath()
        }
        
        // 分析子目录中的package
        let subDirItems = self.fs.listItems(path: dir)
        for subDirItem in subDirItems {
            if !subDirItem.dir() || ignoreDirs.contains(subDirItem.objName()) {
                continue
            }
            
            self.analysisPackages(subDirItem)
        }
        
    }
    
    func analysisPackage(_ directory: FileSystemObject, _ package: GoPackage) {
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
    
    func analysisTypeInfoOnPkg(pkg: GoPackage) {
        for (path, cu) in pkg.files {
            let typeVisiter = GoTypeVisiter(cu: cu, pkg: pkg, file: pkg.fileObjs[path]!)
            typeVisiter.visit_ast(cu.getAST()! as! GoAST)
        }
    }
    
    func analysisSymbolInfoOnPkg(pkg: GoPackage) {
        for (path, cu) in pkg.files {
            let exprVisiter = GoExprVisiter(cu: cu, pkg: pkg, file: pkg.fileObjs[path]!)
            exprVisiter.visit_ast(cu.getAST()! as! GoAST)
        }
    }
    
    func analysisSymbolInfo() {
        // 从底层package开始从下往上处理。每次处理时从package中挑选 没有depPackage的 或者 所有的depPackage都已经被处理 的package进行处理
        var pkgs: [GoPackage] = []
        while true {
            // 执行分析
            let group = DispatchGroup()
            for pkg in pkgs {
                group.enter()
                self.queue.async {
                    self.analysisSymbolInfoOnPkg(pkg: pkg)
                    group.leave()
                }
            }
            group.wait()
            
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
    
    func analysisTypeInfo() {
        // 从底层package开始从下往上处理。每次处理时从package中挑选 没有depPackage的 或者 所有的depPackage都已经被处理 的package进行处理
        var pkgs: [GoPackage] = []
        while true {
            // 执行分析
            let group = DispatchGroup()
            for pkg in pkgs {
                group.enter()
                self.queue.async {
                    self.analysisTypeInfoOnPkg(pkg: pkg)
                    group.leave()
                }
            }
            group.wait()
            
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
}
