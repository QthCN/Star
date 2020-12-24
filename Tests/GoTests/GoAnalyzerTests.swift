//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/15.
//

import XCTest
@testable import Go
@testable import Common

final class GoAnalyzerTests: XCTestCase {
    
    let analyzer = GoAnalyzer()
    let NO_GO_REPO_PATH = "/Users/qintianhuan/Desktop/Projects/code.Series/code.Graph/Star/Tests/GoTests/GoExampleRepos/NonGoRepo"
    let GO_REPO_PATH = "/Users/qintianhuan/Desktop/Projects/code.Series/code.Graph/Star/Tests/GoTests/GoExampleRepos/GoRepo"
    let GO_DECL_REPO_PATH = "/Users/qintianhuan/Desktop/Projects/code.Series/code.Graph/Star/Tests/GoTests/GoExampleRepos/GoDeclRepo"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = Configuration()
        let fs = MacFileSystem(rootDir: NO_GO_REPO_PATH)
        analyzer.analysis(fs: fs, config: config)
        XCTAssertEqual(analyzer.isGoProject(), false)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testIsGoProject() {
        let config = Configuration()
        var fs = MacFileSystem(rootDir: NO_GO_REPO_PATH)
        analyzer.analysis(fs: fs, config: config)
        XCTAssertEqual(analyzer.isGoProject(), false)
        
        fs = MacFileSystem(rootDir: GO_REPO_PATH)
        analyzer.analysis(fs: fs, config: config)
        XCTAssertEqual(analyzer.isGoProject(), true)
    }
    
    func testDeclAnalysis() {
        let config = Configuration()
        let fs = MacFileSystem(rootDir: GO_DECL_REPO_PATH)
        analyzer.analysis(fs: fs, config: config)
        XCTAssertEqual(analyzer.isGoProject(), true)
        let packages = analyzer.listPackages()
        let package = packages[""]!
        let cu = package.getFile(name: "main.go")!
        let ast = cu.getAST()!
        let scope = package.scope
        scope.dump()
    
        
        let identifiers = finds_UASTIdentifier(ast: ast)
        for identifier in identifiers {
            print(identifier, identifier.listDeclarations())
        }
    }
    
}
