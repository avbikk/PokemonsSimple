//
//  PokemonsInitialDataModels.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 17/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation


// MARK: - Response
struct PokemonsData: Codable {
    let count: Int
    var next: String
    let previous: String
    var results: [PokemonsList]
}

// MARK: - Pages
struct PokemonsList: Codable {
    let name: String
    let url: String
}

