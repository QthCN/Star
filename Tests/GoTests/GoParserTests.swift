import XCTest
@testable import Go

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

        import "fmt"

        func main() {

            fmt.Println("go" + "lang")

            fmt.Println("1+1 =", 1+1)
            fmt.Println("7.0/3.0 =", 7.0/3.0)

            fmt.Println(true && false)
            fmt.Println(true || false)
            fmt.Println(!true)
        }
        """
        var i = 1
        while i <= 1 {
            _ = parser.parse(content: code)
            i += 1
        }
        //let ast = parser.parse(content: code)
        //print(ast)
    }
    
}
