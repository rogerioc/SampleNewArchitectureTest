//
//  UIViewExtension.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView : class {
    static var defaultReuseIdentifier: String { get }
}

extension UIView: ReusableView  {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

