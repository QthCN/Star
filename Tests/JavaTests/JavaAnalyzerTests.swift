//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/4/7.
//

import XCTest
@testable import Java
@testable import Common

final class JavaAnalyzerTests: XCTestCase {
    
    let analyzer = JavaAnalyzer()
    
    let NO_JAVA_REPO_PATH = "/Users/qintianhuan/Desktop/Projects/code.Series/code.Graph/Star/Tests/JavaTests/JavaExampleRepos/NonJavaRepo"
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = Configuration()
        let fs = MacFileSystem(rootDir: NO_JAVA_REPO_PATH)
        analyzer.analysis(fs: fs, config: config)
        XCTAssertEqual(analyzer.isJavaProject(), false)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSmokeAnalysis() {
        let config = Configuration()
        let JAVA_TOMCAT_REPO_PATH = "/Users/qintianhuan/Workspace/openSourceProjects/tomcat"
        let fs = MacFileSystem(rootDir: JAVA_TOMCAT_REPO_PATH)
        analyzer.analysis(fs: fs, config: config)
        XCTAssertEqual(analyzer.isJavaProject(), true)
    }
    
}

