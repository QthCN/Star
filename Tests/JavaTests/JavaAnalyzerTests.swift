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
    let JAVA_DECL_REPO_PATH = "/Users/qintianhuan/Desktop/Projects/code.Series/code.Graph/Star/Tests/JavaTests/JavaExampleRepos/DeclRepo"
    
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
    
    func identDeclIs(ident: JavaAST, decl: JavaAST?) -> Bool {
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
    
    func identPosIs(ident: JavaAST, line: Int, col: Int) -> Bool {
        return ident.pos.startLine == line && ident.pos.startCol == col
    }
    
    func identNameDeclPosIs(cu: CompilationUnion, ast: AST, s: String, line: Int, col: Int, noDec: Bool = false, sIdx: Int = 1) -> Bool {
        var cIdx = 1
        let identifiers = finds_UASTIdentifier(ast: ast)
        for identifier in identifiers {
            let name = identifier as! JavaAST
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
    
    func testSmokeAnalysis() {
        let config = Configuration()
        let JAVA_TOMCAT_REPO_PATH = "/Users/qintianhuan/Workspace/openSourceProjects/tomcat"
        let fs = MacFileSystem(rootDir: JAVA_TOMCAT_REPO_PATH)
        analyzer.analysis(fs: fs, config: config)
        XCTAssertEqual(analyzer.isJavaProject(), true)
    }
    
    func testDeclAnalysis() {
        let config = Configuration()
        let fs = MacFileSystem(rootDir: JAVA_DECL_REPO_PATH)
        analyzer.analysis(fs: fs, config: config)
        var cu = analyzer.fsPackages[""]!.files["main.java"]!
        var ast = cu.getAST()!
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "main", line: 4, col: 24, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "args", line: 4, col: 38, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "args", line: 4, col: 38, sIdx: 2))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "ca", line: 8, col: 12, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "ca", line: 8, col: 12, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "ca", line: 8, col: 12, sIdx: 3))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "cb", line: 9, col: 12, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "cb", line: 9, col: 12, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "cb", line: 12, col: 16, sIdx: 3))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "cb", line: 12, col: 16, sIdx: 4))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "cb", line: 15, col: 16, sIdx: 5))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "cb", line: 9, col: 12, sIdx: 6))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "cb", line: 9, col: 12, sIdx: 7))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "cb", line: 22, col: 16, sIdx: 8))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "cb", line: 22, col: 16, sIdx: 9))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "cb", line: 9, col: 12, sIdx: 10))
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "var1", line: 30, col: 17, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "var1", line: 30, col: 17, sIdx: 2))
        
        
        cu = analyzer.fsPackages[""]!.files["t.java"]!
        ast = cu.getAST()!
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "number", line: 4, col: 20, sIdx: 1))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "number", line: 4, col: 20, sIdx: 2))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "t", line: 19, col: 47, sIdx: 3))
        XCTAssertTrue(self.identNameDeclPosIs(cu: cu, ast: ast, s: "t", line: 19, col: 47, sIdx: 5))
        
        let identifiers = finds_UASTIdentifier(ast: ast)
        for identifier in identifiers {
            print(identifier, identifier.listDeclarations())
        }
        
        //print(analyzer.fsPackages[""]!.scope.dump())
    }
    
}

