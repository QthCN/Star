//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/6.
//

import Foundation
import Common
import SwiftTreeSitter
import TreeSitterLanguages


public class GoParser: Common.Parser {
    
    private var tsParser = Parser()
    
    public init() {
        let lang_go = Language(tree_sitter_go())
        tsParser.setLanguage(lang_go)
    }
    
    public func parse(content: String) -> Common.CompilationUnion {
        if let tree = self.tsParser.parse(text: content.utf8) {
            if let ast = self.transform(tree) {
                return Common.CompilationUnion(ast: ast, content: content)
            }
        }
        return Common.CompilationUnion(content: content)
    }
    
    
}

