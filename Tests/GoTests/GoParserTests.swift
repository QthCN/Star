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

        func (s *testTxnSuite) TestRetryExceedCountError(c *C) {
            defer testleak.AfterTest(c)()
            defer func(cnt uint) {
                maxRetryCnt = cnt
            }(maxRetryCnt)

            maxRetryCnt = 5
            err := RunInNewTxn(&mockStorage{}, true, func(txn Transaction) error {
                return nil
            })
            c.Assert(err, NotNil)

            err = RunInNewTxn(&mockStorage{}, true, func(txn Transaction) error {
                return ErrTxnRetryable
            })
            c.Assert(err, NotNil)

            err = RunInNewTxn(&mockStorage{}, true, func(txn Transaction) error {
                return errors.New("do not retry")
            })
            c.Assert(err, NotNil)

            var cfg InjectionConfig
            err1 := errors.New("foo")
            cfg.SetGetError(err1)
            cfg.SetCommitError(err1)
            storage := NewInjectedStore(newMockStorage(), &cfg)
            err = RunInNewTxn(storage, true, func(txn Transaction) error {
                return nil
            })
            c.Assert(err, NotNil)
        }

        func (s *testTxnSuite) TestBasicFunc(c *C) {
            if IsMockCommitErrorEnable() {
                defer MockCommitErrorEnable()
            } else {
                defer MockCommitErrorDisable()
            }

            MockCommitErrorEnable()
            c.Assert(IsMockCommitErrorEnable(), IsTrue)
            MockCommitErrorDisable()
            c.Assert(IsMockCommitErrorEnable(), IsFalse)
        }

        // RunInNewTxn will run the f in a new transaction environment.
        func RunInNewTxn(store Storage, retryable bool, f func(txn Transaction) error) error {
            var (
                err           error
                originalTxnTS uint64
                txn           Transaction
            )
            for i := uint(0); i < maxRetryCnt; i++ {
                txn, err = store.Begin()
                if err != nil {
                    logutil.BgLogger().Error("RunInNewTxn", zap.Error(err))
                    return err
                }

                // originalTxnTS is used to trace the original transaction when the function is retryable.
                if i == 0 {
                    originalTxnTS = txn.StartTS()
                }

                err = f(txn)
                if err != nil {
                    err1 := txn.Rollback()
                    terror.Log(err1)
                    if retryable && IsTxnRetryableError(err) {
                        logutil.BgLogger().Warn("RunInNewTxn",
                            zap.Uint64("retry txn", txn.StartTS()),
                            zap.Uint64("original txn", originalTxnTS),
                            zap.Error(err))
                        continue
                    }
                    return err
                }

                err = txn.Commit(context.Background())
                if err == nil {
                    break
                }
                if retryable && IsTxnRetryableError(err) {
                    logutil.BgLogger().Warn("RunInNewTxn",
                        zap.Uint64("retry txn", txn.StartTS()),
                        zap.Uint64("original txn", originalTxnTS),
                        zap.Error(err))
                    BackOff(i)
                    continue
                }
                return err
            }
            return err
        }

        var (
            // maxRetryCnt represents maximum retry times in RunInNewTxn.
            maxRetryCnt uint = 100
            // retryBackOffBase is the initial duration, in microsecond, a failed transaction stays dormancy before it retries
            retryBackOffBase = 1
            // retryBackOffCap is the max amount of duration, in microsecond, a failed transaction stays dormancy before it retries
            retryBackOffCap = 100
        )

        // BackOff Implements exponential backoff with full jitter.
        // Returns real back off time in microsecond.
        // See http://www.awsarchitectureblog.com/2015/03/backoff.html.
        func BackOff(attempts uint) int {
            upper := int(math.Min(float64(retryBackOffCap), float64(retryBackOffBase)*math.Pow(2.0, float64(attempts))))
            sleep := time.Duration(rand.Intn(upper)) * time.Millisecond
            time.Sleep(sleep)
            return int(sleep)
        }

        // mockCommitErrorEnable uses to enable `mockCommitError` and only mock error once.
        var mockCommitErrorEnable = int64(0)

        // MockCommitErrorEnable exports for gofail testing.
        func MockCommitErrorEnable() {
            atomic.StoreInt64(&mockCommitErrorEnable, 1)
        }

        // MockCommitErrorDisable exports for gofail testing.
        func MockCommitErrorDisable() {
            atomic.StoreInt64(&mockCommitErrorEnable, 0)
        }

        // IsMockCommitErrorEnable exports for gofail testing.
        func IsMockCommitErrorEnable() bool {
            return atomic.LoadInt64(&mockCommitErrorEnable) == 1
        }

        // TxnInfo is used to keep track the info of a committed transaction (mainly for diagnosis and testing)
        type TxnInfo struct {
            StartTS  uint64 `json:"start_ts"`
            CommitTS uint64 `json:"commit_ts"`
            ErrMsg   string `json:"error,omitempty"`
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
