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
    // 当前AST在文件中的Scope
    weak var scope: Scope!
    
    public init(pos: Position, parent: AST? = nil) {
        self.pos = pos
        self.parent = parent
        parent?.children_nodes.append(self)
    }
    
    public func setScope(_ scope: Scope) {
        self.scope = scope
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


// 某个symbol在某个文件中的位置
public class Position: CustomStringConvertible {
    public let startLine: Int
    public let startCol: Int
    public let endLine: Int
    public let endCol: Int
    public let startBytes: Int
    public let endBytes: Int
    
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

// 某个Symbol在整个项目中的位置
public class SymbolPosition: CustomStringConvertible {
    var file: FileSystemObject
    // 从0开始
    var line: Int
    // 从0开始
    var col: Int
    var node: AST

    public init(file: FileSystemObject, line: Int, col: Int, node: AST) {
        self.file = file
        self.line = line
        self.col = col
        self.node = node
    }

    public init(file: FileSystemObject, node: AST) {
        self.file = file
        self.line = node.pos.startLine
        self.col = node.pos.startCol
        self.node = node
    }

    public var description: String {
        return "\(file)[\(line):\(col)](\(node))"
    }
}

