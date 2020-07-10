//
//  StringExtension.swift
//  HotMartTest
//
//  Created by rogerio on 10/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation

extension String {
    
    var localizable: String {
        NSLocalizedString(self, comment: "")
    }
    
}
