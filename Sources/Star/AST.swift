//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/6.
//

import Foundation

open class AST {
    let pos: Position
    weak var parent: AST?
    
    public init(pos: Position, parent: AST? = nil) {
        self.pos = pos
        self.parent = parent
    }
}

open class Position {
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
}
