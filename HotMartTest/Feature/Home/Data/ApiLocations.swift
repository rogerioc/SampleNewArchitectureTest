//
//  ApiLocations.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import Alamofire

protocol LocationsRepository {
    func fetchLocations(success: @escaping (DataLocations)-> (), failure: @escaping (CustomError)->())
    
}

class ApiLocations: LocationsRepository {
    
    let environment: Environment
        
    init(environment: Environment) {
        self.environment = environment
    }
    
    func fetchLocations(success: @escaping (DataLocations) -> (), failure: @escaping (CustomError) -> ()) {
        
        let endPoint = Endpoint(enviroment: environment, endpointTypeProtocol: LocationEndPoint.list)
        
        AF.request(endPoint).responseJSON { response in
                switch response.result {
                case .success(_):
                    guard let data = response.data else {
                        let error = CustomError()
                        failure(error)
                        return
                    }
                    let decoder = JSONDecoder()
                    do {                        
                        let dataLocations = try decoder.decode(DataLocations.self, from: data)
                        success(dataLocations)
                    } catch  {
                        print(error)
                        let errorApi = CustomError()
                        failure(errorApi)
                    }
                    
                case let .failure(error):
                    print(error)
                    let error = CustomError()
                    failure(error)
                }
                
        }
    }
    
    
}
