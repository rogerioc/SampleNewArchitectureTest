//
//  ApiLocationsTests.swift
//  HotMartTestTests
//
//  Created by rogerio on 10/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import XCTest
import Mockit

@testable import HotMartTest

class ApiLocationsTests: XCTestCase {
    
    var interacor: LocationsInteractor!
    var repositoryMock: ApiLocationsMock!

    override class func setUp() {
        super.setUp()
        repositoryMock = ApiLocationsMock(testCase: self)
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
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
