//
//  PokemonsPresenterProtocol.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 19/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

protocol PokemonsPresenterProtocol: AnyObject {
    
    var router: PokemonsRouterProtocol? { set get }
    
    func configureView()
    func showInitialPokemonsData(data: Response?)
    func showInitialPokemonsDataNextPage()
    func reloadPokemonsData(data: Response?)
    func showAlert(errorValue: String)
    
    func pokemonDetailsTapped(url: String)
}

class PokemonsPresenter: PokemonsPresenterProtocol {
    
    weak var view: PokemonsInitialDataViewProtocol?
    var interactor: PokemonsInteractorProtocol?
    var router: PokemonsRouterProtocol?
    
    init(view: PokemonsInitialDataViewProtocol) {
        self.view = view
    }
    
    // MARK: - PokemonsPresenterProtocol methods
    func configureView() {
        interactor?.downloadPokemonsList()
    }
    
    func showInitialPokemonsDataNextPage() {
        interactor?.downloadPokemonsList()
    }

    func showInitialPokemonsData(data: Response?) {
        view?.showInitialPokemonData(data: data)
    }
        
    func reloadPokemonsData(data: Response?) {
        view?.reloadPokemonsData(data: data)
    }

    func showAlert(errorValue: String) {
        view?.showAlert(errorValue: errorValue)
    }
    
    func pokemonDetailsTapped(url: String) {
        router?.openPokemonDetailsViewController(with: url)
    }
    
}
