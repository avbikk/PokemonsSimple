//
//  PokemonsRouter.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 19/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit

protocol PokemonsRouterInput: AnyObject {
    
    func openPokemonDetailsViewController(with url: String?)
}

class PokemonsRouter: PokemonsRouterInput {
    
    weak var viewController: UIViewController? 
    
    init(viewController: PokemonsInitialDataViewController) {
        self.viewController = viewController
    }
    
    func openPokemonDetailsViewController(with url: String?) {
        let pokemonsDetailsViewController = Assembly.createPokemonDetailsScreen(url: url)
        viewController?.navigationController?.pushViewController(pokemonsDetailsViewController, animated: true)
    }
    
}
