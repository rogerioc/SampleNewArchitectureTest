//
//  Coordinator.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import UIKit

public protocol Coordinator {
    var navigatorController: UINavigationController { get set}
    func start()
}


