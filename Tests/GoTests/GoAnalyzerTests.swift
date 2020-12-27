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
    
    func identDeclIs(ident: GoAST, decl: GoAST?) -> Bool {
        if let node = ident as? UASTIdentifier {
            if node.listDeclarations().count == 0 {
                return decl == nil
            } else {
                if node.listDeclarations().count > 1 {
                    return false
                }
                let nodeDecl = node.listDeclarations()[0]
                if let targetDecl = decl {
                    return targetDecl.pos.startLine == nodeDecl.line && targetDecl.pos.startCol == nodeDecl.col
                } else {
                    return false
                }
            }
        } else {
            return false
        }
    }
    
    func identPosIs(ident: GoAST, line: Int, col: Int) -> Bool {
        return ident.pos.startLine == line && ident.pos.startCol == col
    }
    
    func identNameDeclPosIs(cu: CompilationUnion, ast: AST, s: String, line: Int, col: Int, noDec: Bool = false, sIdx: Int = 1) -> Bool {
        var cIdx = 1
        let identifiers = finds_UASTIdentifier(ast: ast)
        for identifier in identifiers {
            let name = identifier as! GoAST
            let identStr = cu.codes(pos: name.pos)
            if identStr == s {
                if cIdx != sIdx {
                    cIdx += 1
                    continue
                }
                
                if identifier.listDeclarations().count != 1 {
                    if noDec && identifier.listDeclarations().count == 0 {
                        return true
                    }
                    return false
                }
                let nodeDecl = identifier.listDeclarations()[0]
                if nodeDecl.line+1 == line && nodeDecl.col+1 == col {
                    return true
                } else {
                    print("\(s) pos: \(name.pos.startLine + 1):\(name.pos.startCol + 1) decl real pos: \(nodeDecl.line+1):\(nodeDecl.col+1) target pos: \(line):\(col)")
                    return false
                }

            }
        }
        return false
    }
    
    func testDeclTidbAnalysis() {
        let config = Configuration()
        let GO_TIDB_REPO_PATH = "/Users/qintianhuan/Workspace/openSourceProjects/tidb"
        let fs = MacFileSystem(rootDir: GO_TIDB_REPO_PATH)
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
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "ast", line: 3, col: 8, sIdx: 1))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "S1", line: 4, col: 6))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "m1", line: 5, col: 5))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "YYY", line: 5, col: 9, noDec: true))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "m2", line: 6, col: 5))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "m3", line: 6, col: 9))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "ZZ", line: 6, col: 12, noDec: true))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "f1", line: 13, col: 6, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "p1", line: 13, col: 9, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "p2", line: 13, col: 13, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "p3", line: 13, col: 21))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "x", line: 14, col: 4, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "xxx", line: 15, col: 4))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "x", line: 14, col: 4, sIdx: 3))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "xxx", line: 15, col: 4, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "x", line: 14, col: 4, sIdx: 4))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "p1", line: 13, col: 9, sIdx: 3))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "p2", line: 13, col: 13, sIdx: 3))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "xxx", line: 15, col: 4, sIdx: 3))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "p4", line: 17, col: 17))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "va", line: 20, col: 8))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "va", line: 20, col: 8, sIdx: 2))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "x", line: 14, col: 4, sIdx: 6))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "x", line: 14, col: 4, sIdx: 7))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "z", line: 28, col: 6, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "z", line: 28, col: 6, noDec: true, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "x", line: 14, col: 4, sIdx: 10))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "x", line: 14, col: 4, noDec: true, sIdx: 11))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "fx", line: 36, col: 5))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "S1", line: 4, col: 6, sIdx: 2))
    
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "rk01", line: 43, col: 9))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "v1", line: 40, col: 5, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "v1", line: 40, col: 5, sIdx: 3))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "v1", line: 44, col: 14, sIdx: 4))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "v1", line: 44, col: 14, sIdx: 5))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "v1", line: 40, col: 5, sIdx: 6))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "rk01", line: 46, col: 6, sIdx: 3))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "rk01", line: 43, col: 9, sIdx: 4))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "s1", line: 51, col: 7, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "S1", line: 4, col: 6, sIdx: 3))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "s1", line: 51, col: 7, sIdx: 2))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "value001", line: 53, col: 5, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "value001", line: 53, col: 5, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "value001", line: 53, col: 5, sIdx: 3))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "value001", line: 53, col: 5, sIdx: 4))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "ifx", line: 56, col: 13, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "ifx", line: 58, col: 13, sIdx: 2))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "ok001", line: 53, col: 15, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "ok001", line: 53, col: 15, sIdx: 2))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "ast", line: 3, col: 8, sIdx: 2))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "t001", line: 75, col: 16, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "t001", line: 75, col: 16, sIdx: 2))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "whatAmI", line: 74, col: 1, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "whatAmI", line: 74, col: 1, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "whatAmI", line: 74, col: 1, sIdx: 3))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "whatAmI", line: 74, col: 1, sIdx: 4))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "i002", line: 73, col: 1, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "i002", line: 74, col: 17, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "i002", line: 74, col: 17, sIdx: 3))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "fi001", line: 119, col: 7, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "fi001", line: 119, col: 7, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "fi001", line: 119, col: 7, sIdx: 3))
        
        
        let identifiers = finds_UASTIdentifier(ast: ast)
        for identifier in identifiers {
            print(identifier, identifier.listDeclarations())
        }
    }
    
}
