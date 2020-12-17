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
    var parser: GoParser = GoParser()
    
    /// 分析结果
    // package列表 key为路径
    var packages: [String:GoPackage] = [:]
    
    // 清理分析结果
    func reset() {
        self.packages = [:]
    }
    
    public init() {}
    
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
    
    func analysis() {
        // 判断是否是一个go的项目
        if !self.isGoProject() {
            return
        }
        
        // 生成package信息
        self.analysisPackages(FileSystemObject())
    }
    
    func analysisPackages(_ dir: FileSystemObject) {
        guard dir.dir() else {
            return
        }
        
        guard !ignoreDirs.contains(dir.objName()) else {
            return
        }
        
        let package = GoPackage()
        // 分析这个package
        self.analysisPackage(dir, package)
        
        
        // 判断package是否有效
        if package.valid() {
            self.packages[dir.rpath()] = package
        }
        
        // 分析子目录中的package
        let subDirItems = self.fs.listItems(path: dir)
        for subDirItem in subDirItems {
            self.analysisPackages(subDirItem)
        }
        
    }
    
    func analysisPackage(_ directory: FileSystemObject, _ package: GoPackage) {
        let dirItems = self.fs.listItems(path: directory)
        
        // 设置同一个package下的parser共用同一个scope
        self.parser.scope = package.scope
        for dirItem in dirItems {
            if dirItem.dir() || !dirItem.objName().hasSuffix(".go") {
                continue
            }
            
            if let content = self.fs.getFileContent(item: dirItem) {
                let cu = self.parser.parse(content: content)
                if cu.getAST() != nil {
                    package.addFile(name: dirItem.objName(), cu: cu)
                    
                    if package.name == "" {
                        if let package_identifier = cu.getAST()?.find(t: goast_package_identifier.self) {
                            package.setName(name: cu.codes(pos: package_identifier.pos))
                        }
                    }
                }
            }
            
        }
    }
}


class GoDeclVisiter: GoVisiter {
    let parser: GoParser
    
    init(parser: GoParser) {
        self.parser = parser
        super.init()
    }
    
    override func visit_function_declaration(_ node: goast_function_declaration) {
        print("goast_function_declaration !!!")
        if let ast = node.body {
            self.visit_block(ast)
        }
        if let ast = node.name {
            self.visit_identifier(ast)
        }
        if let ast = node.parameters {
            self.visit_parameter_list(ast)
        }
        if let ast = node.result {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }
    
    override func visit_identifier(_ node: goast_identifier) {
        print("identifier \(self.parser)")
        print(self.parser.codes(node: node))

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }
}
