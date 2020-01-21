//
//  PokemonsInteractor.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 19/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

protocol PokemonsInteractorInput: AnyObject {
        
    func downloadPokemonsList(url: String?)
}

protocol PokemonsInteractorOutput: AnyObject {
    
    func pokemonsDataDownloaded(data: PokemonsData?)
    func pokemonsDataDownloadFailed(with error: Error)

}

class PokemonsInteractor: PokemonsInteractorInput {
    
    weak var output: PokemonsInteractorOutput?
    
    init(output: PokemonsInteractorOutput) {
        self.output = output
    }
    
    func downloadPokemonsList(url: String?) {
        guard let url = url else { return }
        downloadInitialData(urlString: url) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let resultJson):
                self.output?.pokemonsDataDownloaded(data: resultJson)
            case .failure(let error):
                self.output?.pokemonsDataDownloadFailed(with: error)
            }
        }
    }
}
