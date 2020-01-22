//
//  PokemonDetailsViewOutputMock.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 22/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation
@testable import PokemonsVeryImportant

class PokemonDetailsViewOutputMock: PokemonDetailsViewOutput {
   
    var viewIsReadyCount = 0

    func viewIsReady() {
        viewIsReadyCount += 1
    }
    
    
}
