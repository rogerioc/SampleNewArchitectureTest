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

    override func setUp() {
        super.setUp()
        repositoryMock = ApiLocationsMock(testCase: self)
        interacor = LocationsInteractor(repository: repositoryMock)
    }
   
    func testCallFetch() {
        
        let success = { (dataLocations: DataLocations) in  }
        let failure = { (error: CustomError)  in }
        
        interacor.fetchLocationsList(success: success, failure: failure)
                
        repositoryMock.verify(verificationMode: Once()).fetchLocations(success: success, failure: failure)
        
    }

}
