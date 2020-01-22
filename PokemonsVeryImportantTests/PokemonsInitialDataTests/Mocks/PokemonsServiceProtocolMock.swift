//
//  PokemonsServiceProtocolMock.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 22/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation
@testable import PokemonsVeryImportant

class PokemonsServiceProtocolMock: PokemonsServiceProtocol {

    var downloadDataCount = 0
    
    func downloadData<T>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        downloadDataCount += 1
    }
}
