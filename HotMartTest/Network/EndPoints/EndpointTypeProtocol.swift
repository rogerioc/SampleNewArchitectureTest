//
//  EndpointTypeProtocol.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import Alamofire

public protocol EndpointTypeProtocol {
    var method: HTTPMethod { get }
    var path: String { get }
}
