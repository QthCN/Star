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
    let GO_TYPE_REPO_PATH = "/Users/qintianhuan/Desktop/Projects/code.Series/code.Graph/Star/Tests/GoTests/GoExampleRepos/gtr"
    let GO_SAME_PKG_IMPORT_REPO_PATH = "/Users/qintianhuan/Desktop/Projects/code.Series/code.Graph/Star/Tests/GoTests/GoExampleRepos/SamePkgImportRepo"

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
    
    func testSamePackageImprotAnalysis() {
        let config = Configuration()
        let fs = MacFileSystem(rootDir: GO_SAME_PKG_IMPORT_REPO_PATH)
        analyzer.analysis(fs: fs, config: config)
        XCTAssertEqual(analyzer.isGoProject(), true)
    }
    
    func testDeclTidbAnalysis() {
        let config = Configuration()
        let GO_TIDB_REPO_PATH = "/Users/qintianhuan/Workspace/openSourceProjects/kubernetes"
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
        //let scope = package.scope
        //scope.dump()
        
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
        
        
        //let identifiers = finds_UASTIdentifier(ast: ast)
        //for identifier in identifiers {
            //print(identifier, identifier.listDeclarations())
        //}
    }
    
    func testTypeAnalysis() {
        let config = Configuration()
        let fs = MacFileSystem(rootDir: GO_TYPE_REPO_PATH)
        analyzer.analysis(fs: fs, config: config)
        XCTAssertEqual(analyzer.isGoProject(), true)
        
        let packages = analyzer.packages
        
        XCTAssertTrue(packages["gtr"] != nil)
        XCTAssertTrue(packages["gtr/utils"] != nil)
        
        let mainPkg = packages["gtr"]!
        let mainCU = mainPkg.files["main.go"]!
        let mainAST = mainCU.getAST()!
    
        //let scope = mainPkg.scope
        //scope.dump()
        
        XCTAssertTrue(self.identNameDeclPosIs(cu: mainCU, ast: mainAST, s: "log", line: 4, col: 5, sIdx: 1))
        
        // package log
        var id = mainAST.find(t: goast_identifier.self, line: 9, col: 5) as? UASTExpr
        XCTAssertTrue(id?.getType() == nil)
        
        // var a00 int
        id = mainAST.find(t: goast_identifier.self, line: 13, col: 9) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoBasicType)
        
        // b000 := "x"
        id = mainAST.find(t: goast_identifier.self, line: 14, col: 5) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoBasicType)
        
        // c000, c001 := 1, 2
        id = mainAST.find(t: goast_identifier.self, line: 15, col: 5) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoBasicType)
        id = mainAST.find(t: goast_identifier.self, line: 15, col: 11) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoBasicType)
        
        
        // var f00 func(int, string) int
        id = mainAST.find(t: goast_identifier.self, line: 17, col: 9) as? UASTExpr
        let f00Type = id!.getType()! as! GoSignatureType
        XCTAssertTrue(f00Type.params!.vars.count == 2)
        XCTAssertTrue(f00Type.results!.vars.count == 1)
        
        
        // var f00 func(int, string) int
        id = mainAST.find(t: goast_selector_expression.self, line: 19, col: 5) as? UASTExpr
        let utils_Foo_Type = id!.getType()! as! GoFunc
        XCTAssertTrue(utils_Foo_Type.sig!.params!.vars.count == 0)
        XCTAssertTrue(utils_Foo_Type.sig!.results!.vars.count == 0)
        
        // i, y := controller.DoSthOnX(&controlller.X{})
        id = mainAST.find(t: goast_identifier.self, line: 24, col: 12) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoPointerType)
        
        // m := y.M[1].A.Z -> y
        id = mainAST.find(t: goast_identifier.self, line: 25, col: 14) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoPointerType)
        
        // m := y.M[1].A.Z -> m
        id = mainAST.find(t: goast_identifier.self, line: 25, col: 9) as? UASTExpr
        XCTAssertTrue((id?.getType() as! GoBasicType).kind == .string)
        
        // zm := [10]string{"x"}
        id = mainAST.find(t: goast_identifier.self, line: 31, col: 5) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoArrayType)
        
        // zmItem := zm[0]
        id = mainAST.find(t: goast_identifier.self, line: 32, col: 5) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoBasicType)
        
        
        // if val, ok := dict["foo"]; ok { -> val
        id = mainAST.find(t: goast_identifier.self, line: 35, col: 8) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoNamedType)
        
        
        // if val, ok := dict["foo"]; ok { -> ok
        id = mainAST.find(t: goast_identifier.self, line: 35, col: 32) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoBasicType)
        
        
        // l := &utils.Log{}
        id = mainAST.find(t: goast_identifier.self, line: 42, col: 5) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoNamedType)
        
        
        // l.Println("hello")
        id = mainAST.find(t: goast_selector_expression.self, line: 43, col: 5) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoFunc)
        let funcPrintln000 = mainAST.find(t: goast_field_identifier.self, line: 43, col: 7) as! goast_field_identifier
        XCTAssertTrue(funcPrintln000.listDeclarations().count == 1)
        
        
        // l.Errorln()
        let funcErrorln000 = mainAST.find(t: goast_field_identifier.self, line: 44, col: 7) as! goast_field_identifier
        XCTAssertTrue(funcErrorln000.listDeclarations().count == 1)
        
        id = mainAST.find(t: goast_selector_expression.self, line: 44, col: 5) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoFunc)
        
        // l := &utils.Log{}
        id = mainAST.find(t: goast_identifier.self, line: 42, col: 5) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoNamedType)
        let structType001 = (id!.getType() as! GoNamedType).typ! as! GoStructType
        XCTAssertTrue(structType001.fields.count == 4)
        
        // if let err := controller.DoSthOnX2(&controlller.X{}); err != nil -> err
        id = mainAST.find(t: goast_identifier.self, line: 50, col: 16) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoNamedType)
        
        // c := b
        id = mainAST.find(t: goast_identifier.self, line: 54, col: 17) as? UASTExpr
        XCTAssertTrue(id?.getType() is GoNamedType)
        
        
        // func X3(a, b interface{}) interface {} {
        id = mainAST.find(t: goast_identifier.self, line: 58, col: 6) as? UASTExpr
        let x3FuncType = id?.getType() as! GoFunc
        XCTAssertTrue(x3FuncType.sig?.results?.vars[0].typ is GoInterfaceType)
        
        //print(id)
        //print(id?.getType())
        
    }
    
}
