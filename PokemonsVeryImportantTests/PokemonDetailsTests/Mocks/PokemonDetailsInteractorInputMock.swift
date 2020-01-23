//
//  PokemonDetailsInteractorInputMock.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 22/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation
@testable import PokemonsVeryImportant

class PokemonDetailsInteractorInputMock: PokemonDetailsInteractorInput {
    
    var downloadPokemonDetailsCount = 0
    
    func downloadPokemonDetails(urlPokemonDetails: String) {
        downloadPokemonDetailsCount += 1
    }
}
