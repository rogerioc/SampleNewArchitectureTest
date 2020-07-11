//
//  DetailsInteractor.swift
//  HotMartTest
//
//  Created by rogerio on 11/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation

public protocol DetailsInteractor {
    func getDetail(id: Int, success: @escaping (Details)-> (), failure: @escaping (CustomError)->())
}


public class DetailsInteractorImpl: DetailsInteractor {
    var repository: LocationsRepository
    
    init(repository: LocationsRepository) {
        self.repository = repository
    }
    
    public func getDetail(id: Int, success: @escaping (Details) -> (), failure: @escaping (CustomError) -> ()) {
        repository.getDetail(id: id, success: success, failure: failure)
    }
}

