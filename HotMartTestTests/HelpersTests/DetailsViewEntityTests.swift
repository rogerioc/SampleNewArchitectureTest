//
//  DetailsViewEntityTests.swift
//  HotMartTestTests
//
//  Created by rogerio on 11/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import XCTest
@testable import HotMartTest

class DetailsViewEntityTests: XCTestCase {
    
    func testConvertDetailsSchedule() throws {
        var detailsView = DetailsViewEntity()
        let read = ReadJsonData<Details>()
        let details: Details = read.getJson(fileName: "details")!
        //detailsView.convert(details: details)
        let schedules = detailsView.getSchedule(schedule: details.schedule)
        debugPrint(schedules)
    }
    
    
}
