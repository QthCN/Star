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
        let code = "pacakge main"
        let ast = parser.parse(content: code)
        print(ast)
    }
    
}
