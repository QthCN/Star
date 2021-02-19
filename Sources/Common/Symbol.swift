//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2021/2/18.
//

import Foundation


public class SymbolInfo {
    public var content: String = ""
    public var node: AST?
    public var type: Type?
    public var declarations: [SymbolPosition] = []
    
    public init() {
        
    }
}
