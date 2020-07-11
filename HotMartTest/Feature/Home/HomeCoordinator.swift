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
    private var homeView: HomeViewController?
    private var navigation: MainCoordinator?
    
    init(navigator: UINavigationController,navigation: MainCoordinator? = nil) {
        self.navigatorController = navigator
        self.navigation = navigation
    }
    
    func start() {
        homeView = HomeViewController()
        homeView?.viewModel = HomeFactory.makeHomeViewModel()
        homeView?.viewModel?.navigation = navigation
        guard let view = homeView else {
            return
        }
        self.navigatorController.pushViewController(view, animated: false)
    }
    
    
    
}
