//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2020/12/16.
//

import Foundation

open class Scope {
    public let name: String
    public let parent: Scope?
    public var children: [Scope] = []
    public var declarations: [String:AST] = [:]
    private let lock: NSLock = NSLock()
    
    public init(parent: Scope?, name: String) {
        self.name = name
        self.parent = parent
        self.parent?.addChild(c: self)
    }
    
    public func addChild(c: Scope) {
        self.lock.lock()
        self.children.append(self)
        self.lock.unlock()
    }
    
    public func declare(name: String, node: AST) {
        self.declarations[name] = node
    }
    
    public func find(name: String, depth: Int = -1) -> AST? {
        if let node = self.declarations[name] {
            return node
        }
        if depth == 0 {
            return nil
        }
        return self.parent?.find(name: name, depth: depth-1)
    }
    
    public func searchTopLevelDecl(name: String) -> AST? {
        if let node = self.declarations[name] {
            return node
        }
        
        // 搜索函数
        for child in self.children {
            if child.name == "FunctionDeclaration" {
                
            }
        }
        
        return nil
    }
    
    private func nblank(n: Int) -> String {
        var i = 0
        var s = ""
        while i < n {
            s += " "
            i += 1
        }
        return s
    }
    
    public func dump(_ level: Int = 0) {
        let variables = self.declarations.keys
        let joinedVariables = variables.joined(separator: ", ")
        print("\(self.nblank(n: level))\(self.name): [\(joinedVariables)]\n")
        for child in self.children {
            child.dump(level + 2)
        }
    }
}
