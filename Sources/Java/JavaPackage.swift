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
    
    // import a.b.c; => fullname: a.b.c
    // import a.b.*; => fullname: a.b
    
    let fullname: String
    let isAsterisk: Bool
    let isStatic: Bool
    
    init(fullname: String, isAsterisk: Bool, isStatic: Bool) {
        self.fullname = fullname
        self.isAsterisk = isAsterisk
        self.isStatic = isStatic
    }
    
    public var description: String {
        return "\(fullname) A: \(isAsterisk) S: \(isStatic)"
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
    
    init(analyzer: JavaAnalyzer) {
        self.analyzer = analyzer
    }
    
    public var description: String {
        return "pkg: path - \(self.path) name - \(self.name)"
    }
    
    func addImport(filepath: String, impt: JavaImport) {
        if var imports = self.imports[filepath] {
            imports.append(impt)
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
