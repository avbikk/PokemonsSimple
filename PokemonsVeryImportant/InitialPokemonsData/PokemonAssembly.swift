//
//  PokemonAssembly.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 19/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

protocol PokemonAssemblyProtocol: AnyObject {
    func configure(with viewController: InitialPokemonDataViewController)
}

class PokemonAssembly: PokemonAssemblyProtocol {
    func configure(with viewController: InitialPokemonDataViewController) {
        let presenter = PokemonPresenter(view: viewController)
        let router = PokemonRouter(viewController: viewController)
        let interactor = PokemonInteractor(presenter: presenter)

        viewController.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
    }
}

