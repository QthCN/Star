//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2020/12/20.
//

import Foundation



/// Expr

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

public func finds_UASTExpr(ast: AST) -> [UASTExpr] {
    var nodes: [UASTExpr] = []
    if let node = ast as? UASTExpr {
        nodes.append(node)
    }
    for child in ast.children_nodes {
        let childNodes = finds_UASTExpr(ast: child)
        for childNode in childNodes {
            nodes.append(childNode)
        }
        
    }
    return nodes
}


/// Identifier

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

public func finds_UASTIdentifier(ast: AST) -> [UASTIdentifier] {
    var nodes: [UASTIdentifier] = []
    if let node = ast as? UASTIdentifier {
        nodes.append(node)
    }
    for child in ast.children_nodes {
        let childNodes = finds_UASTIdentifier(ast: child)
        for childNode in childNodes {
            nodes.append(childNode)
        }
        
    }
    return nodes
}
