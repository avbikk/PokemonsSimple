//
//  PokemonDetailsPresenter.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 20/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

class PokemonDetailsPresenter {
    
    weak var view: PokemonDetailsViewInput?
    var interactor: PokemonDetailsInteractorInput?
    
    var urlPokemonDetails: String?
    
    init(view: PokemonDetailsViewInput, url: String?) {
        self.view = view
        self.urlPokemonDetails = url
    }
}

extension PokemonDetailsPresenter: PokemonDetailsViewOutput {
    func viewIsReady() {
        interactor?.downloadPokemonDetails(urlPokemonDetails: urlPokemonDetails)
    }
}

extension PokemonDetailsPresenter: PokemonDetailsInteractorOutput {

    func pokemonsDetailsDownloaded(data: PokemonDetails?) {
        view?.showPokemonDetails(data: data)
    }

    func pokemonsDetailsDownloadFailed(with error: Error) {
        view?.showAlert(with: error.localizedDescription)
    }

}
