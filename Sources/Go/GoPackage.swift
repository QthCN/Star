//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/15.
//

import Foundation

class GoPackage {
    let path: String
    let name: String
    var imports: [GoPackage] = []
    
    init(path: String, name: String) {
        self.path = path
        self.name = name
    }
}
