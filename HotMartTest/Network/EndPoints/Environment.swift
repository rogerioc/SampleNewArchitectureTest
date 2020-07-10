//
//  Environment.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation

public protocol Environment {
    func getBaseUrl() -> URL
}

public class EnvironmentString: Environment {
    
    public func getBaseUrl() -> URL {
        URL(string: "https://hotmart-mobile-app.herokuapp.com")!
    }
}
