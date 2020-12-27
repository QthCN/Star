import XCTest
@testable import Go
@testable import Common

final class GoParserTests: XCTestCase {
    
    let parser = GoParser()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testParserCreationg() {
        let code = """
        package main

        func (s *testTableSuite) TestInfoschemaFieldValue(c *C) {
            tk.MustQuery("show create table t").Check(
                testkit.Rows("" +
                    "t CREATE TABLE `t` (\\n" +
                    "  `c` int(11) NOT NULL AUTO_INCREMENT,\\n" +
                    "  `d` int(11) DEFAULT NULL,\\n" +
                    "  PRIMARY KEY (`c`)\\n" +
                    "  PRIMARY KEY (`c`\\n" +
                    "  PRIMARY KEY (`c`)\\n" +
                    "  PRIMARY KEY (`c`)\\n" +
                    "  PRIMARY KEY (`c`)\\n" +
                    ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=30002"))
        }

        """
        var i = 1
        while i <= 10 {
            let cu = parser.parse(content: code)
            i += 1
            //let dv = GoDeclVisiter(cu: cu, pkgScope: Scope(parent: nil, name: ""), fileObject: FileSystemObject())
            //dv.visit_ast(cu.getAST()! as! GoAST)
            
        }
        //let ast = parser.parse(content: code)
        //print(ast)
        
    }
    
}
