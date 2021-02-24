//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2021/2/18.
//

import Foundation


public class SymbolInfo {
    // 符号的具体内容
    public var content: String = ""
    // 符号对应的AST节点
    public var node: AST?
    // 符号如果是Expr的话，对应的Type
    public var type: Type?
    // 符号如果是Identifier的话，对应的decls
    public var declarations: [SymbolPosition] = []
    
    public init() {
        
    }
}
