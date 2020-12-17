//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/15.
//

import Foundation
import Common

class GoPackage {
    var path: String = ""
    var name: String = ""
    var files: [String:CompilationUnion] = [:]
    let scope: Scope = Scope(parent: nil)
    
    init() {
    }
    
    func valid() -> Bool {
        // 判断是否为一个valid的pacakge，一个valid的package需要包含有效的go文件
        return true
    }
    
    func addFile(name: String, cu: CompilationUnion) {
        self.files[name] = cu
    }
    
    func setName(name: String) {
        self.name = name
    }
}
