//
//  HomeCoordinator.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    var navigatorController: UINavigationController
    var homeView: HomeViewController?
    
    init(navigator: UINavigationController) {
        self.navigatorController = navigator
    }
    
    func start() {
        homeView = HomeViewController()
        homeView?.viewModel = HomeFactory.getHomeViewModel()
        guard let view = homeView else {
            return
        }
        self.navigatorController.pushViewController(view, animated: false)
    }
    
    
    
}
