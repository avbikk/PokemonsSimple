//
//  Assembly.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 19/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit

class Assembly {
    
    static func configure() -> UIViewController { 

        let viewController = PokemonsInitialDataViewController()
        let presenter = PokemonsPresenter(view: viewController)
        let router = PokemonsRouter(viewController: viewController)
        let interactor = PokemonsInteractor(output: presenter)

        viewController.output = presenter
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
    
    static func createPokemonDetailsScreen(url: String?) -> UIViewController {
        let viewController = PokemonDetailsViewController()
        let presenter = PokemonDetailsPresenter(view: viewController, url: url)
        let interactor = PokemonDetailsInteractor(output: presenter)

        viewController.presenter = presenter
        presenter.interactor = interactor

        return viewController
    }
}
