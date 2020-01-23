//
//  PokemonDetailsViewInputMock.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 22/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation
@testable import PokemonsVeryImportant

class PokemonDetailsViewInputMock: PokemonDetailsViewInput {
    
    var showPokemonDetailsCount = 0
    var showAlertCount = 0
    
    func showPokemonDetails(data: PokemonDetails) {
        showPokemonDetailsCount += 1
    }
    
    func showAlert(with message: String) {
        showAlertCount += 1
    }
    
    
}
