//
//  PokemonsInteractorOutputMock.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 22/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation
@testable import PokemonsVeryImportant

class PokemonsInteractorOutputMock: PokemonsInteractorOutput {
    
    var pokemonsDataDownloadedCount = 0
    var pokemonsDataDownloadFailedCount = 0
    
    func pokemonsDataDownloaded(data: PokemonsData?) {
        pokemonsDataDownloadedCount += 1
    }
    
    func pokemonsDataDownloadFailed(with error: Error) {
        pokemonsDataDownloadFailedCount += 1
    }
    
    
}
