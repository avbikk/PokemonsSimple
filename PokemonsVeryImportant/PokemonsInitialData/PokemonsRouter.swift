//
//  PokemonsRouter.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 19/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit

protocol PokemonsRouterInput: AnyObject {
    
    func openPokemonDetailsViewController(with urlString: String)
}

class PokemonsRouter: PokemonsRouterInput {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func openPokemonDetailsViewController(with urlString: String) {
        let pokemonsDetailsViewController = Assembly.createPokemonDetailsScreen(url: urlString)
        viewController?.navigationController?.pushViewController(pokemonsDetailsViewController, animated: true)
    }
    
}
