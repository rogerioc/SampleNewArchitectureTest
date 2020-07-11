//
//  MainCoordinator.swift
//  HotMartTest
//
//  Created by rogerio on 11/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import UIKit


public class MainCoordinator: Coordinator {
    public var navigatorController: UINavigationController
    
    private var homeCoordinator: HomeCoordinator!
    private var detailsCoordinator: DetailsCoordinator!
    
    init(navigatorController: UINavigationController) {
        self.navigatorController = navigatorController
        homeCoordinator = HomeCoordinator(navigator: navigatorController, navigation: self)
        detailsCoordinator = DetailsCoordinator(navigatorController: navigatorController)
    }
    
    public func start() {
        homeCoordinator.start()
    }
    
    
}


extension MainCoordinator: Navigation {
    
    public enum Route {
        case selectedItem(Int)
    }
    
    public func goTo(route: Route) {
        switch route {
        case .selectedItem(let id):
           
            detailsCoordinator.id = id
            detailsCoordinator.start()
        }
    }
            
}
