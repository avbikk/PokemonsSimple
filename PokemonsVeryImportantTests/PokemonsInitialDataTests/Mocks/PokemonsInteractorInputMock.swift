//
//  PokemonsInteractorInputMock.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 22/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation
@testable import PokemonsVeryImportant

class PokemonsInteractorInputMock: PokemonsInteractorInput {
    
    var downloadPokemonsListCount = 0
    
    func downloadPokemonsList(url: String?) {
        downloadPokemonsListCount += 1
    }
}
