//
//  PokemonsInteractorProtocol.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 19/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

protocol PokemonsInteractorProtocol: AnyObject {
    
    var initialPokemonsData: Response? { get }
    var isPokemonsDataDownloaded: Bool { get set}
    
    func downloadPokemonsList()
}

class PokemonsInteractor: PokemonsInteractorProtocol {
    
    weak var presenter: PokemonsPresenterProtocol?
    
    var initialPokemonsData: Response?
    var isPokemonsDataDownloaded = true
    
    var nextPage: String?
    
    init(presenter: PokemonsPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - PokemonsInteractorProtocol methods
    func downloadPokemonsList() {
        
        guard (isPokemonsDataDownloaded == true) else { return }
        isPokemonsDataDownloaded = false
        
        nextPage = nextPage ?? "https://pokeapi.co/api/v2/ability/?limit=20&offset=20"
        
        downloadInitialData(urlString: nextPage!) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let resultJson):
                if self.initialPokemonsData != nil {
                    self.presenter?.reloadPokemonsData(data: resultJson)
                }
                else {
                    self.initialPokemonsData = resultJson
                    self.presenter?.showInitialPokemonsData(data: self.initialPokemonsData)
                }
                self.nextPage = resultJson.next
                self.isPokemonsDataDownloaded = true
            case .failure(let error):
                self.presenter?.showAlert(errorValue: error.localizedDescription)
            }
        }
    }
}
