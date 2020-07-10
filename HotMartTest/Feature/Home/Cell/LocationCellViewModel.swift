//
//  LocationCellViewModel.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation

class LocationCellViewModel {
    let location: Location
        
    var name = Observer<String>("")
    
    init(location: Location) {
      self.location = location
    }
    
    func start() {
        name.value = location.name
    }
}
