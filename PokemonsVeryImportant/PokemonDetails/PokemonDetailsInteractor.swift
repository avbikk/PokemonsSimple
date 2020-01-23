//
//  PokemonDetailsInteractor.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 20/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

protocol PokemonDetailsInteractorInput: AnyObject {
    
    func downloadPokemonDetails(urlPokemonDetails: String)
}

protocol PokemonDetailsInteractorOutput: AnyObject {
    
    func pokemonsDetailsDownloaded(data: PokemonDetails)
    func pokemonsDetailsDownloadFailed(with error: Error)
}

class PokemonDetailsInteractor: PokemonDetailsInteractorInput {
    
    weak var output: PokemonDetailsInteractorOutput?
    let service: PokemonsServiceProtocol
        
    init(service: PokemonsServiceProtocol) {
        self.service = service
    }
    
    func downloadPokemonDetails(urlPokemonDetails: String) {
        service.downloadData(urlString: urlPokemonDetails) { [weak self] (result: Result<PokemonDetails, Error>) in
            switch result {
            case .success(let resultJson):
                self?.output?.pokemonsDetailsDownloaded(data: resultJson)
            case .failure(let error):
                self?.output?.pokemonsDetailsDownloadFailed(with: error)
            }
        }
    }
}
