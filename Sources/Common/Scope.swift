//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2020/12/16.
//

import Foundation

public class Scope {
    public let name: String
    public let parent: Scope?
    public var children: [Scope] = []
    public var declarations: [String:AST] = [:]
    
    public init(parent: Scope?, name: String) {
        self.name = name
        self.parent = parent
        self.parent?.children.append(self)
    }
    
    public func declare(name: String, node: AST) {
        self.declarations[name] = node
    }
    
    public func find(name: String) -> AST? {
        if let node = self.declarations[name] {
            return node
        }
        return self.parent?.find(name: name)
    }
}
