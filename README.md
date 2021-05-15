# Star

支持多语言的iOS客户端分析工具。

跨文件type inference例子:

```
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
    
    //print(analyzer.structure(cu: mainCU))

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
```
