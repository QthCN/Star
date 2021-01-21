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
    // 该package import的其它package。路径为被import的package的path
    var imports: [String] = []
    // 这个package下top scope的method，临时在这里存放，在第二阶段会和对应的type name关联
    var methods_to_bind: [goast_method_declaration] = []
    
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
}
