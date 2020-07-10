//
//  HomeFactory.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
class HomeFactory {
    
    static func getHomeViewModel() -> HomeViewModel {
        HomeViewModel(interactor: HomeFactory.getLocationsInteractor())
    }
    
    static func getLocationsInteractor()-> LocationsInteractorProtocol {
        LocationsInteractor(repository: HomeFactory.getLocationsRepository())
    }
    
    static func getLocationsRepository() -> LocationsRepository {
        ApiLocations(environment: HomeFactory.getEnvironment())
    }
    
    static func getEnvironment() -> Environment {
        EnvironmentString()
    }
}
