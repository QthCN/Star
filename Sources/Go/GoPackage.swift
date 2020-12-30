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
