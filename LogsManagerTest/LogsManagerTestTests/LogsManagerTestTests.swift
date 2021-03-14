//
//  LogsManagerTestTests.swift
//  LogsManagerTestTests
//
//  Created by Usman Tarar on 3/15/21.
//

import XCTest
@testable import LogsManagerTest

class LogsManagerTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLogFailure() {
        let error = NSError(domain: "dataNilError", code: -100001, userInfo: nil)
        let logManagerTest = MockLogsManager(payload: nil, error: error)
        logManagerTest.log(api: "") { (result, error) in
            XCTAssertNil(result)
            XCTAssertNotNil(error)
        }
    }
    
    func testLogSuccess() {
        let payload: [String: Any] = [
            "lat": 0,
            "lon": 0,
            "time": 0,
            "ext": "",
        ]
        let logManagerTest = MockLogsManager(payload: payload, error: nil)
        logManagerTest.log(api: "MockUrl") { (result, error) in
            XCTAssertNotNil(result)
            XCTAssertNil(error)
        }
    }

}
