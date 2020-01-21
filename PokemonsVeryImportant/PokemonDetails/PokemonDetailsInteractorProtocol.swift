//
//  PokemonDetailsInteractorProtocol.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 20/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

protocol PokemonDetailsInteractorProtocol: AnyObject {
    
    var urlPokemonDetails: String? { get }
    var pokemonDetails: Welcome? { get }
    var isPokemonDetailsDownloaded: Bool { get set}
    
    func downloadPokemonDetails()
}

class PokemonDetailsInteractor: PokemonDetailsInteractorProtocol {
    
    weak var presenter: PokemonDetailsPresenterProtocol?
   
    var urlPokemonDetails: String?
    var pokemonDetails: Welcome?
    var isPokemonDetailsDownloaded = true
        
    init(presenter: PokemonDetailsPresenter, url: String?) {
        self.presenter = presenter
        self.urlPokemonDetails = url
    }
    
    // MARK: - PokemonDetailsInteractorProtocol methods
    func downloadPokemonDetails() {
        guard let urlPokemonDetails = urlPokemonDetails else { return }
        guard (isPokemonDetailsDownloaded == true) else { return }
        isPokemonDetailsDownloaded = false
        
        downloadingPokemonDetails(urlString: urlPokemonDetails) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let resultJson):
                self.pokemonDetails = resultJson
                self.presenter?.showPokemonDetails(data: self.pokemonDetails)
                self.isPokemonDetailsDownloaded = true
            case .failure(let error):
                self.presenter?.showAlert(errorValue: error.localizedDescription)
            }
        }
    }
}
