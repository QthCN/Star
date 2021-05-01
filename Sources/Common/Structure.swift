//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2021/5/1.
//

import Foundation

public enum StructureType {
    case imp
    case function
    case variable
    case type
    case other
}

public class Structure {
    weak var node: AST! = nil
    var name: String = ""
    var type: StructureType = .imp
    
    public init(node: AST, type: StructureType, name: String) {
        self.node = node
        self.type = type
        self.name = name
    }
}

