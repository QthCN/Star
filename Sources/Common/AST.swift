//
//  AST.swift
//  
//
//  Created by 秦天欢 on 2020/12/6.
//

import Foundation

open class AST {
    public let pos: Position
    weak var parent: AST?
    var children_nodes: [AST] = []
    
    public init(pos: Position, parent: AST? = nil) {
        self.pos = pos
        self.parent = parent
        parent?.children_nodes.append(self)
    }
    
    public func find<T> (t: T) -> AST? {
        if type(of: self) is T {
            return self
        }
        for child in self.children_nodes {
            if let node = child.find(t: t) {
                return node
            }
        }
        return nil
    }
}

open class Position: CustomStringConvertible {
    let startLine: Int
    let startCol: Int
    let endLine: Int
    let endCol: Int
    let startBytes: Int
    let endBytes: Int
    
    public init(_ startLine: Int, _ startCol: Int, _ endLine: Int, _ endCol: Int, _ startBytes: Int, _ endBytes: Int) {
        self.startLine = startLine
        self.startCol = startCol
        self.endLine = endLine
        self.endCol = endCol
        self.startBytes = startBytes
        self.endBytes = endBytes
    }
    
    public var description: String {
        return "\(startLine):\(startCol) \(endLine):\(endCol) \(startBytes):\(endBytes)"
    }
}
