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

        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
        let urlString = "https://pokeapi.co/api/v2/ability/?limit=20&offset=20"

        let service = PokemonsService(session: session)

        let viewController = PokemonsInitialDataViewController()
        let interactor = PokemonsInteractor(service: service)
        let router = PokemonsRouter(viewController: viewController)

        let presenter = PokemonsPresenter(view: viewController, interactor: interactor, router: router)

        viewController.output = presenter
        interactor.output = presenter
        
        return viewController
    }
    
    static func createPokemonDetailsScreen(url: String) -> UIViewController {
        
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
        let service = PokemonsService(session: session)
        
        let viewController = PokemonDetailsViewController()
        let interactor = PokemonDetailsInteractor(service: service)
        
        let presenter = PokemonDetailsPresenter(view: viewController, interactor: interactor, url: url)
        
        viewController.output = presenter
        interactor.output = presenter

        return viewController
    }
}
