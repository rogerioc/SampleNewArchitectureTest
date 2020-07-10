//
//  EndPoint.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import Alamofire

struct Endpoint {
    var enviroment: Environment
    var endpointTypeProtocol: EndpointTypeProtocol
}

extension Endpoint: URLRequestConvertible {
        
    func asURLRequest() throws -> URLRequest {
        let url = enviroment.getBaseUrl()
        var urlRequest = URLRequest(url: url.appendingPathComponent(endpointTypeProtocol.path))
        urlRequest.httpMethod = endpointTypeProtocol.method.rawValue
        //urlRequest = try JSONEncoding.default.encode(urlRequest, with: access.dictionary())
        
        return urlRequest
    }
    
}

