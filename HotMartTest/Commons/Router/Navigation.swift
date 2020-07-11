//
//  Router.swift
//  HotMartTest
//
//  Created by rogerio on 11/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation

public protocol Navigation {
    associatedtype Route
    func goTo(route: Route)
}
