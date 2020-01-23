//
//  PokemonsInitialDataViewInputMock.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 22/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit
@testable import PokemonsVeryImportant

class PokemonsInitialDataViewInputMock: UIViewController, PokemonsInitialDataViewInput {
    
    var showInitialPokemonDataCount = 0
    var reloadPokemonsDataCount = 0
    var showAlertCount = 0
            
    func showInitialPokemonData(pokemonsDownloadedList: [PokemonsList]) {
        showInitialPokemonDataCount += 1
    }
    
    func reloadPokemonsData(pokemonsDownloadedList: [PokemonsList]) {
        reloadPokemonsDataCount += 1
    }
    
    func showAlert(with message: String) {
        showAlertCount += 1
    }
}
