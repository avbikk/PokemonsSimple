//
//  PokemonDetailsAssembly.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 20/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit

class PokemonDetailsAssembly {
    static func configure(url: String?) -> UIViewController {
        let viewController = PokemonDetailsViewController()
        let presenter = PokemonDetailsPresenter(view: viewController)
        let interactor = PokemonDetailsInteractor(presenter: presenter, url: url)

        viewController.presenter = presenter
        presenter.interactor = interactor

        return viewController
    }
}

