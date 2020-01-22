//
//  PokemonsService.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 17/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

protocol PokemonsServiceProtocol {
    func downloadData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void)
}

class PokemonsService: PokemonsServiceProtocol {

    func downloadData<DataType: Decodable>(urlString: String, completion: @escaping (Result<DataType, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard String(data: data, encoding: .utf8) != nil else { return }
            DispatchQueue.main.async {
                do {
                    let resultJson = try JSONDecoder().decode(DataType.self, from: data)
                    completion(.success(resultJson))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}


