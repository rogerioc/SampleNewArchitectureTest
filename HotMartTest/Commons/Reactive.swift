//
//  Reactive.swift
//  CurrencyChanges
//
//  Created by rogerio on 01/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation


class Observer<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?

    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
        
}

class ObserverVoid: Observer<Void> {
    
    init() {
        super.init(())
    }
    
    func execute() {
        self.listener?(())
    }
}
