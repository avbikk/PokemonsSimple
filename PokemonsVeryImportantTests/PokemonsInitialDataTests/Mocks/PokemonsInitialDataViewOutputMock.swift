//
//  PokemonsInitialDataViewOutputMock.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 22/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation
@testable import PokemonsVeryImportant

class PokemonsInitialDataViewOutputMock: PokemonsInitialDataViewOutput {    
    
    var viewIsReadyCount = 0
    var showNextPagePokemonsDataCount = 0
    var pokemonDetailsTapped = 0
    
    func viewIsReady() {
        viewIsReadyCount += 1
    }
    
    func didShowLastItem() {
        showNextPagePokemonsDataCount += 1
    }
    
    func pokemonDetailsTapped(with urlString: String) {
        pokemonDetailsTapped += 1
    }
    
    
}
