//
//  PokemonRouterProtocol.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 19/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

protocol PokemonRouterProtocol: AnyObject {
    func closeCurrentViewController()
    func openInitialPokemonListViewController(with pokemonsList: Response?)
    func openPokemonDetailsController(with pokemonsDetails: Welcome?)
}

class PokemonRouter: PokemonRouterProtocol {
    
    weak var viewController: InitialPokemonDataViewController!
    
    init(viewController: InitialPokemonDataViewController) {
        self.viewController = viewController
    }
    
    func openInitialPokemonListViewController(with pokemonsList: Response?) {
        
    }
    
    func openPokemonDetailsController(with pokemonsDetails: Welcome?) {
        
    }
    
    func closeCurrentViewController() {
        
    }

}
