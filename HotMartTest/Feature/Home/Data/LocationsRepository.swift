//
//  LocationsRepository.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation

protocol LocationsInteractorProtocol {
    func fetchLocationsList(success: @escaping (DataLocations)-> (), failure: @escaping (CustomError)->())
}

class LocationsInteractor: LocationsInteractorProtocol {
    let repository: LocationsRepository
    
    init(repository: LocationsRepository) {
        self.repository = repository
    }
    
    func fetchLocationsList(success: @escaping (DataLocations) -> (), failure: @escaping (CustomError) -> ()) {
        repository.fetchLocations(success: success, failure: failure)
    }
}
