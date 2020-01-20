//
//  PokemonsRouterProtocol.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 19/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit

protocol PokemonsRouterProtocol: AnyObject {
    
    func openPokemonDetailsViewController(with url: String?)
}

class PokemonsRouter: PokemonsRouterProtocol {
    
    weak var viewController: UIViewController? 
    
    init(viewController: PokemonsInitialDataViewController) {
        self.viewController = viewController
    }
    
    // MARK: - PokemonsRouterProtocol methods
    func openPokemonDetailsViewController(with url: String?) {
        let pokemonsDetailsViewController = PokemonDetailsAssembly.configure(url: url)
        viewController?.navigationController?.pushViewController(pokemonsDetailsViewController, animated: true)
    }
    
}
