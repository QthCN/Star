//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/15.
//

import Foundation
import Common

public class GoPackage {
    var path: String = ""
    var name: String = ""
    var files: [String:CompilationUnion] = [:]
    let scope: Scope = Scope(parent: nil, name: "Package")
    // 该package import的其它package的path的string。
    var imports: [String] = []
    // 该package依赖的当前repo中的package，最底层的package这里为空
    var depPackages: [GoPackage] = []
    // 该package是否已经被type info分析过
    var typeInfoAnalysised: Bool = false
    
    init() {
    }
    
    func valid() -> Bool {
        return self.name != ""
    }
    
    func addFile(name: String, cu: CompilationUnion) {
        self.files[name] = cu
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func getFile(name: String) -> CompilationUnion? {
        return self.files[name]
    }
    
    func addImport(path: String) {
        let p = path.trimmingCharacters(in: ["\""])
        if !self.imports.contains(p) {
            self.imports.append(p)
        }
    }
}

