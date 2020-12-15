//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2020/12/14.
//

import Foundation

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

// Resolver负责definition、type的解析
public protocol Resolver {
    func setParser(parser: Parser)
    func setFileSystem(fs: FileSystem)
    func symbolType(position: SymbolPosition) -> Type?
    func symbolDefinition(position: SymbolPosition) -> [SymbolPosition]
}
