//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/15.
//

import Foundation
import Common

public class GoPackage: CustomStringConvertible {
    // 对analyzer的引用
    weak var analyzer: GoAnalyzer?
    var path: String = ""
    var name: String = ""
    var files: [String:CompilationUnion] = [:]
    var fileObjs: [String:FileSystemObject] = [:]
    let scope: Scope = Scope(parent: globalScope, name: "Package")
    // 该pacakge import的alias和path的对应[filePath: [alias: importPath]]
    var importsAlias: [String:[String:String]] = [:]
    // 该package import的其它package的path的string。
    var imports: [String] = []
    // 该package依赖的当前repo中的package，最底层的package这里为空
    var depPackages: [GoPackage] = []
    // 该package是否已经被type info分析过
    var typeInfoAnalysised: Bool = false
    // 该package是否已经被expr resolver分析过
    var exprResolverAnalysised: Bool = false
    
    init(analyzer: GoAnalyzer) {
        self.analyzer = analyzer
    }
    
    public var description: String {
        return "pkg: path - \(self.path) name - \(self.name)"
    }
    
    func valid() -> Bool {
        return self.name != ""
    }
    
    func addFile(name: String, cu: CompilationUnion, fileObj: FileSystemObject) {
        self.files[name] = cu
        self.fileObjs[name] = fileObj
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func getFile(name: String) -> CompilationUnion? {
        return self.files[name]
    }
    
    func getPkgByName(fileObj: FileSystemObject, name: String) -> GoPackage? {
        // 首先搜索name是否为一个alias
        if let path = self.importsAlias[fileObj.objName()]?[name] {
            // 根据path获取pacakge
            return self.analyzer?.getPackageByPath(p: path)
        } else {
            // 根据pacakge name返回pacakge
            return self.analyzer?.getPackageByName(n: name)
        }
    }
    
    func addFileImportWithAlias(fileObj: FileSystemObject, alias: String, path: String) {
        if var fileAliases = self.importsAlias[fileObj.objName()] {
            fileAliases[alias] = path
        } else {
            self.importsAlias[fileObj.objName()] = [:]
            self.importsAlias[fileObj.objName()]![alias] = path
        }
    }
    
    func addImport(path: String) {
        let p = path.trimmingCharacters(in: ["\""])
        if !self.imports.contains(p) {
            self.imports.append(p)
        }
    }
    
    // 在Package的top level查找symbol
    func findSymbol(name: String) -> SymbolPosition? {
        for scope in scope.children {
            // 这里的scope为file层面的scope，在这个文件层面的scope搜索top level declaration
            
            
            if let symbolNode = scope.find(name: name, depth: 0) {
                var parts = scope.name.components(separatedBy: .whitespaces)
                var path = parts[parts.count-1]
                parts = path.components(separatedBy: "/")
                path = parts[parts.count-1]
                let file = self.fileObjs[path]!
                return SymbolPosition(file: file, node: symbolNode)
            }
        }
        return nil
    }
}

