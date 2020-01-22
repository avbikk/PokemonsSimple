//
//  PokemonsPresenter.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 19/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

class PokemonsPresenter {
    
    weak var view: PokemonsInitialDataViewInput?
    let interactor: PokemonsInteractorInput
    let router: PokemonsRouterInput
    
    private var currentData: PokemonsData?
    private var isPokemonsDataDownloading = false
    private var nextPage = "https://pokeapi.co/api/v2/ability/?limit=20&offset=20"

    init(view: PokemonsInitialDataViewInput, interactor: PokemonsInteractorInput, router: PokemonsRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension PokemonsPresenter: PokemonsInitialDataViewOutput {

    func viewIsReady() {
        if isPokemonsDataDownloading { return }
        isPokemonsDataDownloading = true
        interactor.downloadPokemonsList(url: nextPage)
    }
    
    func didShowLastItem() {
        if let currentData = currentData, !isPokemonsDataDownloading {
            isPokemonsDataDownloading = true
            interactor.downloadPokemonsList(url: currentData.next)
        }
    }

    func pokemonDetailsTapped(with urlString: String) {
        router.openPokemonDetailsViewController(with: urlString)
    }
}

extension PokemonsPresenter: PokemonsInteractorOutput {
    
    func pokemonsDataDownloaded(data: PokemonsData?) {
        isPokemonsDataDownloading = false
        guard let data = data else { return }
        let pokemonsDownloadedList = data.results
        if currentData != nil {
            nextPage = data.next
            view?.reloadPokemonsData(pokemonsDownloadedList: pokemonsDownloadedList)
        } else {
            currentData = data
            view?.showInitialPokemonData(pokemonsDownloadedList: pokemonsDownloadedList)
        }
    }
    
    func pokemonsDataDownloadFailed(with error: Error) {
        view?.showAlert(with: error.localizedDescription)
    }
}


