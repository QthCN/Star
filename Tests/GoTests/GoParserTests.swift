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
        package kv

        import (
            "errors"
            "time"

            . "github.com/pingcap/check"
            "github.com/pingcap/tidb/util/testleak"
        )

        var _ = Suite(&testTxnSuite{})

        type testTxnSuite struct {
        }

        func (s *testTxnSuite) SetUpTest(c *C) {
        }

        func (s *testTxnSuite) TearDownTest(c *C) {
        }

        func (s *testTxnSuite) TestBackOff(c *C) {
            defer testleak.AfterTest(c)()
            mustBackOff(c, 1, 2)
            mustBackOff(c, 2, 4)
            mustBackOff(c, 3, 8)
            mustBackOff(c, 100000, 100)
        }

        func mustBackOff(c *C, cnt uint, sleep int) {
            c.Assert(BackOff(cnt), LessEqual, sleep*int(time.Millisecond))
        }
        """
        var i = 1
        while i <= 1000 {
            _ = parser.parse(content: code)
            i += 1
        }
        let ast = parser.parse(content: code)
        print(ast)
    }
    
}
