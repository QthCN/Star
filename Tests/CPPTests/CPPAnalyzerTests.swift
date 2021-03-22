//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/3/18.
//

import XCTest
@testable import CPP
@testable import Common

final class CPPAnalyzerTests: XCTestCase {
    
    let analyzer = CPPAnalyzer()
    
    func testSmokeAnalysis() {
        let config = Configuration()
        let fs = MacFileSystem(rootDir: "")
        analyzer.analysis(fs: fs, config: config)
    }
    
}
