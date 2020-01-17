//
//  Models.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 17/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation


// MARK: - Response
struct Response: Codable {
    let count: Int
    let next, previous: String
    let results: [PokemonMainDescription]
}

// MARK: - Pages
struct PokemonMainDescription: Codable {
    let name: String
    let url: String
}

