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

        let service = PokemonsService()

        let viewController = PokemonsInitialDataViewController()
        let interactor = PokemonsInteractor(service: service)
        let router = PokemonsRouter(viewController: viewController)

        let presenter = PokemonsPresenter(view: viewController, interactor: interactor, router: router)

        viewController.output = presenter
        interactor.output = presenter
        
        return viewController
    }
    
    static func createPokemonDetailsScreen(url: String?) -> UIViewController {
        
        let service = PokemonsService()
        
        let viewController = PokemonDetailsViewController()
        let interactor = PokemonDetailsInteractor(service: service)
        
        let presenter = PokemonDetailsPresenter(view: viewController, interactor: interactor, url: url)
        
        viewController.presenter = presenter
        interactor.output = presenter

        return viewController
    }
}
