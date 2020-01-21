//
//  PokemonDetailsInteractor.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 20/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

protocol PokemonDetailsInteractorInput: AnyObject {
    
    func downloadPokemonDetails(urlPokemonDetails: String?)
}

protocol PokemonDetailsInteractorOutput: AnyObject {
    
    func pokemonsDetailsDownloaded(data: PokemonDetails?)
    func pokemonsDetailsDownloadFailed(with error: Error)
}

class PokemonDetailsInteractor: PokemonDetailsInteractorInput {
    
    weak var output: PokemonDetailsInteractorOutput?
    let service: PokemonsServiceProtocol
        
    init(service: PokemonsServiceProtocol) {
        self.service = PokemonsService()
    }
    
    func downloadPokemonDetails(urlPokemonDetails: String?) {
        guard let urlPokemonDetails = urlPokemonDetails else { return }
        service.downloadData(urlString: urlPokemonDetails) { [weak self] (result: Result<PokemonDetails, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let resultJson):
                self.output?.pokemonsDetailsDownloaded(data: resultJson)
            case .failure(let error):
                self.output?.pokemonsDetailsDownloadFailed(with: error)
            }
        }
    }
}
