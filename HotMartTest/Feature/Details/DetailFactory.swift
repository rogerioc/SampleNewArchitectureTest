//
//  DetailFactory.swift
//  HotMartTest
//
//  Created by rogerio on 11/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation

class DetailFactory {
    
    static func makeDetailViewModel(id: Int) -> DetailsViewModel {
        DetailsViewModel(idLocation: id, interactor: DetailFactory.makeDetailsInteractor())
    }
    
    static func makeDetailsInteractor()-> DetailsInteractor {
        DetailsInteractorImpl(repository: DetailFactory.makeLocationsRepository())
    }
    
    static func makeLocationsRepository() -> LocationsRepository {
        ApiLocations(environment: DetailFactory.makeEnvironment())
    }
    
    static func makeEnvironment() -> Environment {
        EnvironmentString()
    }
    
}
