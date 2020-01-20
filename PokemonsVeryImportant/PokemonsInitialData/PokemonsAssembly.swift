//
//  PokemonsAssembly.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 19/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit

class PokemonsAssembly {
    
    static func configure() -> UIViewController { 

        let viewController = PokemonsInitialDataViewController()
        let presenter = PokemonsPresenter(view: viewController)
        let router = PokemonsRouter(viewController: viewController)
        let interactor = PokemonsInteractor(presenter: presenter)

        viewController.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
}

