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
    
    var method: HTTPMethod {
        switch self {
        case .list:
            return .get
        }
    }
    
    var path: String {
        switch self {
            case .list:
                return "/locations"
        }
    }
    
    
    
}
