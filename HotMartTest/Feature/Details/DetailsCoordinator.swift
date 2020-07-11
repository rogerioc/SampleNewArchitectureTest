//
//  DetailsCoordinator.swift
//  HotMartTest
//
//  Created by rogerio on 11/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import UIKit

public class DetailsCoordinator: Coordinator {
    
    public var navigatorController: UINavigationController
    private var viewController: DetailsViewController?
    public var id: Int?
    
    init(navigatorController: UINavigationController) {
        self.navigatorController = navigatorController
    }
    
    public func start() {
        guard let id = id else { return }
        viewController = DetailsViewController()
        viewController?.viewModel = DetailFactory.makeDetailViewModel(id: id)
        guard let view = viewController else { return }
        self.navigatorController.pushViewController(view, animated: true)
    }
    
    
    
}
