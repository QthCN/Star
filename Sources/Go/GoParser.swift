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
    
    var scope: Scope? = nil
    
    public override init() {
        super.init()
        
        let lang_go = Language(tree_sitter_go())
        tsParser.setLanguage(lang_go)
    }
    
    public override func parse(content: String) -> Common.CompilationUnion {
        if let tree = self.tsParser.parse(text: content.utf8) {
            self.content = content
            if let ast = self.transform(tree) {
                return Common.CompilationUnion(ast: ast, content: content)
            }
        }
        return Common.CompilationUnion(content: content)
    }
    
    
}

