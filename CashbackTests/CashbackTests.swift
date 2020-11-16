//
//  CashbackTests.swift
//  CashbackTests
//
//  Created by Bidisha Biswas on 11/15/20.
//

import XCTest
@testable import Cashback

class CashbackTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }

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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetJsonResponse() {
        let offersDetailExpectation = expectation(description: "Get the data parsed")
        
        let url = Bundle.main.url(forResource: "Offers", withExtension: "json")!
        do {
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let offers = try decoder.decode([Offer].self, from: jsonData)
            XCTAssertNotNil(offers)
            offersDetailExpectation.fulfill()
        } catch let error {
            XCTFail(error.localizedDescription)
        }
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
}
