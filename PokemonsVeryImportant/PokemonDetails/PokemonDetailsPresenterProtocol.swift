//
//  PokemonDetailsPresenter.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 20/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

protocol PokemonDetailsPresenterProtocol: AnyObject {
        
    func configureView()
    func showPokemonDetails(data: Welcome?)
    func showAlert(errorValue: String)

}

class PokemonDetailsPresenter: PokemonDetailsPresenterProtocol {
    
    weak var view: PokemonDetailsViewProtocol?
    var interactor: PokemonDetailsInteractorProtocol?
    
    init(view: PokemonDetailsViewProtocol) { 
        self.view = view
    }
    
    func configureView() {
        interactor?.downloadPokemonDetails()
    }

    func showPokemonDetails(data: Welcome?) {
        view?.showPokemonDetails(data: data)
    }
        
    func showAlert(errorValue: String) {
        view?.showAlert(errorValue: errorValue)
    }
}
