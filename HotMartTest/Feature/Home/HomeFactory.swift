//
//  HomeFactory.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
class HomeFactory {
    
    static func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(interactor: HomeFactory.makeLocationsInteractor())
    }
    
    static func makeLocationsInteractor()-> LocationsInteractorProtocol {
        LocationsInteractor(repository: HomeFactory.makeLocationsRepository())
    }
    
    static func makeLocationsRepository() -> LocationsRepository {
        ApiLocations(environment: DefaultFactor.makeEnvironment())
    }
        
}
