//
//  Locations.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
//"name": "Café Escritório",
//           "review": 3.8,
//           "type": "Coworking",
//           "id": 1

struct DataLocations: Codable {
    let listLocations: [Location]
}

struct Location: Codable {
    let name: String
    let review: Double
    let type: String
    let id: Int
}
