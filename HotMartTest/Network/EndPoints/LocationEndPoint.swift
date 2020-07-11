//
//  LocationEndPoint.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import Alamofire

enum LocationEndPoint: EndpointTypeProtocol {
    case list
    case detail(Int)
    
    var method: HTTPMethod {
        switch self {
        case .list, .detail:
            return .get
        
        }
    }
    
    var path: String {
        switch self {
            case .list:
                return "/locations"
            case .detail(let id):
            return "/locations/\(id)"
        }
    }
    
    
    
}
