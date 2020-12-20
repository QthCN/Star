//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2020/12/20.
//

import Foundation

public protocol UASTExpr {
    var type: Type? { get }
    func getType() -> Type?
}

extension UASTExpr {
    public var type: Type? {
        return nil
    }
    
    public func getType() -> Type? {
        return self.type
    }
}

public protocol UASTIdentifier: UASTExpr {
    var declarations: [SymbolPosition] { get }
    func listDeclarations() -> [SymbolPosition]
}

extension UASTIdentifier {
    public var declarations: [SymbolPosition] {
        return []
    }
    
    public func listDeclarations() -> [SymbolPosition] {
        return self.declarations
    }
}
