//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/6.
//

import Foundation
import Star
import SwiftTreeSitter
import TreeSitterLanguages


class GoParser: Star.Parser {
    
    private var tsParser = Parser()
    
    init() {
        let lang_go = Language(tree_sitter_go())
        tsParser.setLanguage(lang_go)
    }
    
    func parse(content: String) -> Star.AST? {
        if let tree = self.tsParser.parse(text: content.utf8) {
            return self.transform(tree)
        } else {
            return nil
        }
    }
    
    
}

