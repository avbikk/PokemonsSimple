//
//  PokemonPresenterProtocol.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 19/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

protocol PokemonPresenterProtocol: AnyObject {
    
    var router: PokemonRouterProtocol! { set get }
    
    func configureView()
    func showInitialPokemonsData(data: Response?)
    func showInitialPokemonsDataNextPage()
    func reloadPokemonsData(data: Response?)
    func showAlert(errorValue: String)
    
    func pokemonDetailsTapped(url: String)
}

class PokemonPresenter: PokemonPresenterProtocol {
    
    weak var view: InitialPokemonDataViewProtocol!
    var interactor: PokemonInteractorProtocol!
    var router: PokemonRouterProtocol!
    
    required init(view: InitialPokemonDataViewProtocol) {
        self.view = view
    }
    
    // MARK: - PokemonPresenterProtocol methods
    func configureView() {
        interactor.downloadPokemonsList()
    }
    
    func showInitialPokemonsDataNextPage() {
        interactor.downloadPokemonsList()
    }

    func showInitialPokemonsData(data: Response?) {
        view.showInitialPokemonData(data: data)
    }
        
    func reloadPokemonsData(data: Response?) {
        view.reloadPokemonsData(data: data)
    }

    func showAlert(errorValue: String) {
        view.showAlert(errorValue: errorValue)
    }
    
    func pokemonDetailsTapped(url: String) {
        
    }
    
}
