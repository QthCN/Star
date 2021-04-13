//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/4/8.
//

import Foundation
import Common

// 某个文件的import信息
public class JavaImport: CustomStringConvertible {
    
    // import a.b.c; => fullname: a.b, classname: c
    // import a.b.*; => fullname: a.b
    // import static a.b.c; => fullname: a, classname: b, methodname: c
    
    let fullname: String
    let classname: String
    let methodname: String
    let isAsterisk: Bool
    let isStatic: Bool
    
    init(fullname: String, classname: String, methodname: String, isAsterisk: Bool, isStatic: Bool) {
        self.fullname = fullname
        self.classname = classname
        self.methodname = methodname
        self.isAsterisk = isAsterisk
        self.isStatic = isStatic
    }
    
    public var description: String {
        return "\(fullname).\(classname).\(methodname)"
    }
}

public class JavaPackage: CustomStringConvertible {
    weak var analyzer: JavaAnalyzer?
    // package所在文件的目录，例如src/a/pkgx
    var path: String = ""
    // package的名字，例如org.xxx.pkg
    var name: String = ""
    // package下的文件名以及对应的CU
    var files: [String:CompilationUnion] = [:]
    // package下文件名及对应的FileObj
    var fileObjs: [String:FileSystemObject] = [:]
    // package层面的scope
    let scope: Scope = Scope(parent: globalScope, name: "Package")
    // 文件与其import的信息
    var imports: [String:[JavaImport]] = [:]
    // 文件依赖的package
    var depPackages: [JavaPackage] = []
    // 该package是否已经被type info分析过
    var typeInfoAnalysised: Bool = false
    // 该package是否已经被expr resolver分析过
    var exprResolverAnalysised: Bool = false
    
    init(analyzer: JavaAnalyzer) {
        self.analyzer = analyzer
    }
    
    public var description: String {
        return "pkg: path - \(self.path) name - \(self.name)"
    }
    
    func addImport(filepath: String, impt: JavaImport) {
        if self.imports[filepath] != nil {
            self.imports[filepath]!.append(impt)
        } else {
            self.imports[filepath] = [impt]
        }
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
    
}
