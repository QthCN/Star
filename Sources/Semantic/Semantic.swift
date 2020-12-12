//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/12.
//

import Foundation
import Common
import Go


public class Semantic {
    private let parsers: [SupportedLanguege: Parser] = [
        .go: GoParser(),
    ]
    
    public init() {
    }
    
    public func parse(language: SupportedLanguege, content: String) -> CompilationUnion {
        switch language {
        case .go:
            return self.parsers[.go]!.parse(content: content)
        }
    }
}
