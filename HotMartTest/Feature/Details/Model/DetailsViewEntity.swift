//
//  DetailsViewEntity.swift
//  HotMartTest
//
//  Created by rogerio on 11/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation

public struct DetailsViewEntity {
    var name: String
    var review: String
    var type: String
    var about: String
    var schedule: String
    var phone: String
    var address: String
    var starsON: Int
    
    init(name: String,
         review: String,
         type: String,
         about: String,
         schedule: String,
         phone: String,
         address: String,
         starsON: Int = 0) {
        
        self.name = name
        self.review = review
        self.type = type
        self.about = about
        self.phone = phone
        self.address = address
        self.schedule = schedule
        self.starsON = starsON
    }
    
    init() {
        self.name =  ""
        self.review = ""
        self.type = ""
        self.about = ""
        self.phone = ""
        self.address = ""
        self.schedule = ""
        self.starsON = 0
    }
    
   
}

extension DetailsViewEntity {
    
    public mutating func convert(details: Details) {
        self.name = details.name
        self.review = String(format: "%0.1f", details.review)
        self.type = details.type
        self.about = details.about
        self.phone = details.phone
        self.address = details.adress
        self.schedule = getSchedule(schedule: details.schedule)
        self.starsON = Int(round(details.review))
    }
    
    func getSchedule(schedule: [String: Schedule]?) -> String {
        var result = ""
        return result
    }
}


