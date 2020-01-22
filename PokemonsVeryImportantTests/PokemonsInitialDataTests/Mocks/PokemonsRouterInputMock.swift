//
//  PokemonsRouterInputMock.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 22/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation
@testable import PokemonsVeryImportant

class PokemonsRouterInputMock: PokemonsRouterInput {
    
    var openPokemonDetailsViewControllerCount = 0
    
    func openPokemonDetailsViewController(with url: String?) {
        openPokemonDetailsViewControllerCount += 1
    }
}
