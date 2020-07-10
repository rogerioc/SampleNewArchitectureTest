//
//  ApiLocationsMock.swift
//  HotMartTestTests
//
//  Created by rogerio on 10/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import Mockit
import XCTest
@testable import HotMartTest

class ApiLocationsMock: Mock, LocationsRepository {
    
    let callHandler: CallHandler

    init(testCase: XCTestCase) {
         callHandler = CallHandlerImpl(withTestCase: testCase)
    }
       
   
    func instanceType() -> ApiLocationsMock {
      return self
    }
    
    func fetchLocations(success: @escaping (DataLocations) -> (), failure: @escaping (CustomError) -> ()) {
        callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: success, failure)
    }    
    
}
