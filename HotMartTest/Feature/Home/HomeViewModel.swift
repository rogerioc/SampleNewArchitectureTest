//
//  HomeViewModel.swift
//  HotMartTest
//
//  Created by rogerio on 09/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation

class HomeViewModel {
    let interactor: LocationsInteractorProtocol
    var navigation: MainCoordinator?
    
    var reloadTable = ObserverVoid()
    var error = Observer<String>("")
    
    var quantity: Int {
        get {
            return locations?.listLocations.count ?? 0
        }
    }
    
    private var locations: DataLocations?
    
    init(interactor: LocationsInteractorProtocol) {
        self.interactor = interactor
    }
    
    func fetch()  {
        self.interactor.fetchLocationsList(success: { [unowned self] (dataLocations) in
            self.locations = dataLocations
            self.reloadTable.execute()
            },failure: { [unowned self]  (error) in
                self.error.value = "Error"
        })
    }
    
    func start() {
        fetch()
    }
    
    public subscript(index: Int) -> Location? {
        guard let list = self.locations?.listLocations,
            index >= 0 ,
            index < list.count else {
                return nil
        }
        return list[index]
    }
    
    public func selected(index: Int) {
        guard let list = self.locations?.listLocations,
            index >= 0 ,
            index < list.count else {
                return
        }
        let id = list[index].id
        navigation?.goTo(route: .selectedItem(id))
    }
}
