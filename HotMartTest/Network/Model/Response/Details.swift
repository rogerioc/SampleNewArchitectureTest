//
//  Details.swift
//  HotMartTest
//
//  Created by rogerio on 11/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation

//{
//  "name": "Café Escritório",
//  "review": 3.8,
//  "type": "Coworking",
//  "id": 1,
//  "about": "Posuere congue eget condimentum purus cubilia aptent senectus, auctor euismod potenti ad fringilla aenean, ante quisque fringilla porttitor consectetur aenean. sed purus neque duis quisque nullam ornare mattis torquent, feugiat risus fermentum duis tincidunt quisque curabitur, nibh magna sapien consequat non bibendum curae. sociosqu mattis aptent ultricies in aptent fusce magna libero,",
//  "schedule": [
//    {
//      "sunday": {
//        "open": "7h",
//        "close": "13h"
//      },
//      "monday": {
//        "open": "7h",
//        "close": "23h"
//      },
//      "tuesday": {
//        "open": "7h",
//        "close": "23h"
//      },
//      "wednesday": {
//        "open": "7h",
//        "close": "23h"
//      },
//      "thursday": {
//        "open": "7h",
//        "close": "23h"
//      },
//      "friday": {
//        "open": "7h",
//        "close": "23h"
//      },
//      "saturday": {
//        "open": "7h",
//        "close": "23h"
//      }
//    }
//  ],
//  "phone": "+553130332222",
//  "adress": "Passagem Companheiro dos Amigos,833,Piraporinha,Belo Horizonte,Minas Gerais"
//}

public struct Details: Codable {
    let name: String
    let review: Double
    let type: String
    let id: Int
    let about: String
    let schedule: [String: Schedule]?
    let scheduleArray: [[String: Schedule]]?
    let phone: String
    let adress: String
    
    init(name: String,
         review: Double,
         type: String,
         id: Int,
         about: String,
         schedule: [String: Schedule]?,
         scheduleArray: [[String: Schedule]]?,
         phone: String,
         adress: String) {
        self.name = name
        self.type = type
        self.review = review
        self.id = id
        self.adress = adress
        self.about = about
        self.scheduleArray = scheduleArray
        self.schedule = schedule
        self.phone = phone
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case review
        case type
        case id
        case about
        case schedule
        case phone
        case adress
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: CodingKeys.name)
        let review = try container.decode(Double.self, forKey:CodingKeys.review)
        let type = try container.decode(String.self, forKey:CodingKeys.type)
        let id = try container.decode(Int.self, forKey:CodingKeys.id)
        let about = try container.decode(String.self, forKey:CodingKeys.about)
        let phone = try container.decode(String.self, forKey:CodingKeys.phone)
        let adress = try container.decode(String.self, forKey:CodingKeys.adress)
        var schedule:[String: Schedule]? = nil
        var scheduleArray:[[String: Schedule]]? = nil
        do{
            schedule = try container.decode([String: Schedule].self, forKey:CodingKeys.schedule)
        } catch {
             scheduleArray = try container.decode([[String: Schedule]].self, forKey:CodingKeys.schedule)
        }
        self.init(name: name, review: review, type: type, id: id, about: about, schedule: schedule, scheduleArray: scheduleArray, phone: phone, adress: adress)
    }
    
    
}

public struct Schedule: Codable {
    let open: String
    let close: String
}
