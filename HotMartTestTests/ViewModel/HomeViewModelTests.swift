//
//  HomeViewModelTests.swift
//  HotMartTestTests
//
//  Created by rogerio on 10/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import XCTest
import Mockit
@testable import HotMartTest

class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var interactorMock: LocationsInteractorMock!
    
    override func setUp() {
        interactorMock = LocationsInteractorMock(testCase: self)
        viewModel = HomeViewModel(interactor: interactorMock)
    }
    
    func testViewModelStart() throws {
        viewModel.start()
        let success = { (dataLocations: DataLocations) in  }
        let failure = { (error: CustomError)  in }
        let quantity = viewModel.quantity
        interactorMock.verify(verificationMode: Once()).fetchLocationsList(success: success, failure: failure)
        XCTAssertEqual(quantity , 0 )
    }
    
    func testViewModelFetch() throws {
        
        let success = { (dataLocations: DataLocations) in  }
        let failure = { (error: CustomError)  in }
        
        viewModel.fetch()
        
        interactorMock.verify(verificationMode: Once()).fetchLocationsList(success: success, failure: failure)
    }
    
    func testViewModelReloadData() throws {
        
        let success = { (dataLocations: DataLocations) in  }
        let failure = { (error: CustomError)  in }
        let exp = expectation(description: "Check load data is called")
        
        let data  = DataLocations(listLocations: [Location(name: "", review: 0.0, type: "", id: 0)])
        interactorMock.when().call(withReturnValue: interactorMock.fetchLocationsList(success: success, failure: failure),andArgumentMatching:[ Anything(), Anything()]).thenDo { (args:[Any?]) -> Void in
            (args[0] as! (DataLocations) -> (Void))(data)
        }
        var reload = false
        viewModel.reloadTable.bind {  _ in
            reload = true
            exp.fulfill()
        }
        viewModel.fetch()
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(reload, true)
        }
        
    }
    
    func testViewModelHasOneLocation() throws {
        
        let success = { (dataLocations: DataLocations) in  }
        let failure = { (error: CustomError)  in }
        let data  = DataLocations(listLocations: [Location(name: "", review: 0.0, type: "", id: 0)])
        interactorMock.when().call(withReturnValue: interactorMock.fetchLocationsList(success: success, failure: failure),andArgumentMatching:[ Anything(), Anything()]).thenDo { (args:[Any?]) -> Void in
            (args[0] as! (DataLocations) -> (Void))(data)
        }
        viewModel.fetch()
        
        let quantity = viewModel.quantity
        
        XCTAssertEqual(quantity , 1 )
    }
    
    func testViewModelsCorrectLocation() throws {
        
        let success = { (dataLocations: DataLocations) in  }
        let failure = { (error: CustomError)  in }
        let locationTest = Location(name: "name", review: 1.0, type: "type", id: 1)
        let data  = DataLocations(listLocations: [locationTest])
        interactorMock.when().call(withReturnValue: interactorMock.fetchLocationsList(success: success, failure: failure),andArgumentMatching:[ Anything(), Anything()]).thenDo { (args:[Any?]) -> Void in
            (args[0] as! (DataLocations) -> (Void))(data)
        }
        viewModel.fetch()
        
        let location = viewModel[0]
        
        XCTAssertEqual(location?.name ,  locationTest.name)
        XCTAssertEqual(location?.type ,  locationTest.type)
        XCTAssertEqual(location?.review , locationTest.review)
        XCTAssertEqual(location?.id ,  locationTest.id)
    }
    
    func testViewModelFetchError() throws {
          
          let success = { (dataLocations: DataLocations) in  }
          let failure = { (error: CustomError)  in }
          let exp = expectation(description: "Check error in fetch")
          
          let error  = CustomError()
          interactorMock.when().call(withReturnValue: interactorMock.fetchLocationsList(success: success, failure: failure),andArgumentMatching:[ Anything(), Anything()]).thenDo { (args:[Any?]) -> Void in
              (args[1] as! (CustomError) -> (Void))(error)
          }
        var errorStr = ""
        
        var reload = false
        viewModel.reloadTable.bind {  _ in
            reload = true
            exp.fulfill()
        }
    
        viewModel.error.bind { (error) in
            errorStr = error
            exp.fulfill()
        }
          viewModel.fetch()
          
          waitForExpectations(timeout: 10) { error in
              if let error = error {
                  XCTFail("waitForExpectationsWithTimeout errored: \(error)")
              }
              XCTAssertEqual(errorStr, "Error")
              XCTAssertFalse(reload)
          }
          
      }
    
    
}
