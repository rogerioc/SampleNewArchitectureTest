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
            DispatchQueue.main.async { [weak self] in
                guard let _self = self else { return }
                _self.listener?(_self.value)
            }
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
        DispatchQueue.main.async { [weak self] in
            guard let _self = self else { return }
            _self.listener?(())
        }
    }
}
