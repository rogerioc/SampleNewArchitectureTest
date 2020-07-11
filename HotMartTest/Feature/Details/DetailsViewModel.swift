//
//  DetailsViewModel.swift
//  HotMartTest
//
//  Created by rogerio on 11/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation

public class DetailsViewModel {
    private var interactor: DetailsInteractor
    private var idLocation: Int
    private var detailView: DetailsViewEntity
    
    var details: Observer<DetailsViewEntity>
    var showScreen: Observer<Bool>
    var showErro: Observer<String>
    init(idLocation: Int,interactor: DetailsInteractor) {
        self.interactor = interactor
        self.idLocation = idLocation
        self.detailView = DetailsViewEntity()
        details = Observer(detailView)
        showScreen = Observer(false)
        showErro = Observer("")
    }
    
    func getDetail() {
        showScreen.value = false
        interactor.getDetail(id: idLocation, success: { [weak self] (details) in
            guard let _self = self else { return }
            _self.detailView.convert(details: details)
            _self.details.value = _self.detailView
            _self.showScreen.value = true
        },failure: { [weak self] (error) in
            guard let _self = self else { return }
            _self.showErro.value = "Erro"
        })
    }
    
    func start() {
        getDetail()
//         var detail = DetailsViewEntity()
//        detail.name = "Padaria Pelicano"
//        detail.review = "3.8"
//        detail.starsON = 4
//        detail.about = "Se você curte um pão fresquinho, ou uma sobremesa caprichada, você precisa incluir uma visitinha a Padaria Pelicano no seu roteiro por BH. A fila é gigantesca, mas os quitutes estão sem dúvida entre os melhores da cidade."
//        detail.phone = "+553122442244"
//        detail.address = "Rua do ouro, 297 - Serra Belo Horizonte - MG"
//        self.details.value = detail
    }
}
