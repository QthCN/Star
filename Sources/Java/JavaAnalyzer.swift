//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/4/7.
//

import Foundation
import Common

let ignoreDirs = ["vender", "node_modules", ".git"]

public class JavaAnalyzer: Analyzer {
    var fs: FileSystem! = nil
    var config: Configuration = Configuration()
    let queue = DispatchQueue(label: "star.javaanalyzer", qos: .userInteractive, attributes: .concurrent)
    private var sem = DispatchSemaphore(value: 0)
    
    /// 分析结果
    // package列表 key为import路径
    var packages: [String:JavaPackage] = [:]
    // package列表，key为package目录路径
    var fsPackages: [String:JavaPackage] = [:]
    
    public init() {}
    
    public func analysis(fs: FileSystem, config: Configuration) {
        self.fs = fs
        self.config = config
        self.reset()
        self.analysis()
        print("java analysis finished")
    }
    
    func isJavaProject() -> Bool {
        // 搜索三层目录看是否有java结尾的文件，有的话就认为是java的项目
        let topDirItems = self.fs.listItems(path: FileSystemObject())
        for topDirItem in topDirItems {
            if !topDirItem.dir() && topDirItem.objName().hasSuffix(".java") {
                return true
            }
            
            if topDirItem.dir() {
                let subDirItems = self.fs.listItems(path: topDirItem)
                for subDirItem in subDirItems {
                    if !subDirItem.dir() && subDirItem.objName().hasSuffix(".java") {
                        return true
                    }
                }
                
                for subDirItem in subDirItems {
                    if subDirItem.dir() {
                        let subSubDirItems = self.fs.listItems(path: subDirItem)
                        for subSubDirItem in subSubDirItems {
                            if !subSubDirItem.dir() && subSubDirItem.objName().hasSuffix(".java") {
                                return true
                            }
                        }
                    }
                }
            }
        }
        
        return false
    }
    
    func reset() {
        
    }
    
    func analysis() {
        if !self.isJavaProject() {
            return
        }
        
        // 生成package信息
        self.analysisPackages(FileSystemObject())
        self.analysisPackageDirs()
        
        // 生成import依赖图
        
        // 生成type definition信息
        
        // 生成expr的type和identifier的resolve信息
        
    }
    
    private func analysisImportDependGraph() {
        // TODO
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
        let package = JavaPackage(analyzer: self)
        // 分析这个package
        self.analysisPackage(dir, package)
        
        // 判断package是否有效
        if package.valid() {
            package.path = dir.rpath()
            
            lock.lock()
            self.fsPackages[dir.rpath()] = package
            self.packages[package.name] = package
            lock.unlock()
        }
        
        sem.signal()
    }
    
    private func analysisPackage(_ directory: FileSystemObject, _ package: JavaPackage) {
        let dirItems = self.fs.listItems(path: directory)
        // 设置同一个package下的parser共用同一个scope
        let parser = JavaParser()
        parser.scope = package.scope
        for dirItem in dirItems {
            if dirItem.dir() || !dirItem.objName().hasSuffix(".java") {
                continue
            }
            
            if let content = self.fs.getFileContent(item: dirItem) {
                let cu = parser.parse(content: content)
                if cu.getAST() != nil {
                    package.addFile(name: dirItem.objName(), cu: cu, fileObj: dirItem)
                    
                    if package.name == "" {
                        if let package_declaration = cu.getAST()?.find(t: javaast_package_declaration.self) {
                            if package_declaration.children_nodes.count > 0 {
                                let name_node = package_declaration.children_nodes.last!
                                package.setName(name: cu.codes(pos: name_node.pos))
                            }
                        }
                    }
                    
                    // 对文件进行decl分析
                    let declVisiter = JavaDeclVisiter(cu: cu, pkg: package, pkgScope: package.scope, fileObject: dirItem)
                    declVisiter.visit_ast(cu.getAST()! as! JavaAST)
                }
            }
            
        }
    }
    
    public func cu(fs: FileSystemObject) -> CompilationUnion? {
        // TODO
        return nil
    }
    
    public func symbolInfo(cu: CompilationUnion, offset: Int) -> SymbolInfo? {
        // TODO
        return nil
    }
    
    public func callGraph(symbol: SymbolInfo) -> CGCaller? {
        // TODO
        return nil
    }
}

