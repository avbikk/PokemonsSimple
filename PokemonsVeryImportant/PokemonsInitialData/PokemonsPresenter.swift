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
    
    var currentData: PokemonsData?
    var isPokemonsDataDownloaded = true

    init(view: PokemonsInitialDataViewInput, interactor: PokemonsInteractorInput, router: PokemonsRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension PokemonsPresenter: PokemonsInitialDataViewOutput {

    func viewIsReady() {
        let nextPage = "https://pokeapi.co/api/v2/ability/?limit=20&offset=20"
        guard (isPokemonsDataDownloaded == true) else { return }
        isPokemonsDataDownloaded = false
        interactor.downloadPokemonsList(url: nextPage)
    }
    
    func showNextPagePokemonsData() {
        if let currentData = currentData {
            guard (isPokemonsDataDownloaded == true) else { return }
            isPokemonsDataDownloaded = false
            interactor.downloadPokemonsList(url: currentData.next)
        }
    }

    func pokemonDetailsTapped(url: String) {
        router.openPokemonDetailsViewController(with: url)
    }
}

extension PokemonsPresenter: PokemonsInteractorOutput {
    
    func pokemonsDataDownloaded(data: PokemonsData?) {
        isPokemonsDataDownloaded = true
        guard let data = data else { return }
        let pokemonsDownloadedList = data.results
        if currentData != nil {
            currentData?.next = data.next
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


