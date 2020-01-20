//
//  PokemonInteractorProtocol.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 19/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

protocol PokemonInteractorProtocol: AnyObject {
    
    var initialPokemonData: Response? { get }
    
    var isPokemonDataDownloaded: Bool { get set}
    
    func downloadPokemonsList()
    
}

class PokemonInteractor: PokemonInteractorProtocol {
    
    weak var presenter: PokemonPresenterProtocol!
    //    let serverService: ServerServiceProtocol = ServerService()
    
    var initialPokemonData: Response?
    var isPokemonDataDownloaded = true
    
    var nextPage: String?
    
    required init(presenter: PokemonPresenterProtocol) {
        self.presenter = presenter
    }
    
    func downloadPokemonsList() {
        
        guard (isPokemonDataDownloaded == true) else { return }
        isPokemonDataDownloaded = false
        
        nextPage = nextPage ?? "https://pokeapi.co/api/v2/ability/?limit=20&offset=20"
        
        downloadInitialData(urlString: nextPage!) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let resultJson):
                if self.initialPokemonData != nil {
                    self.presenter.reloadPokemonsData(data: resultJson)
                }
                else {
                    self.initialPokemonData = resultJson
                    self.presenter.showInitialPokemonsData(data: self.initialPokemonData)
                }
                self.nextPage = resultJson.next
                self.isPokemonDataDownloaded = true
            case .failure(let error):
                self.presenter.showAlert(errorValue: error.localizedDescription)
            }
        }
    }
}
