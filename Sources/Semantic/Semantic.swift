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
    private let analyzers: [SupportedLanguege: Analyzer] = [
        .go: GoAnalyzer(),
    ]
    
    // 分析某个项目
    public func analysis(fs: FileSystem, config: Configuration) {
        for (_, analyzer) in analyzers {
            analyzer.analysis(fs: fs, config: config)
        }
    }
    
}
