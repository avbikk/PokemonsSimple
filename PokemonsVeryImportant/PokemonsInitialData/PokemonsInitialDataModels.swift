//
//  PokemonsInitialDataModels.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 17/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation


// MARK: - Response
struct Response: Codable {
    let count: Int
    var next, previous: String
    var results: [PokemonMainDescription]
}

// MARK: - Pages
struct PokemonMainDescription: Codable {
    let name: String
    let url: String
}

