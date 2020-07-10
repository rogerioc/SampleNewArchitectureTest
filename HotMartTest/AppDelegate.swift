//
//  AppDelegate.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var homeCoordinator: HomeCoordinator?
    
    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.backgroundColor = UIColor.topaz
        navigationController.navigationBar.tintColor = UIColor.topaz
        return navigationController
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = navigationController
        homeCoordinator = HomeCoordinator(navigator: self.navigationController)
        window?.makeKeyAndVisible()
        homeCoordinator?.start()
        return true
    }



}

