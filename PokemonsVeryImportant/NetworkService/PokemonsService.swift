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
        
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "BadUrl", code: 0, userInfo: [NSLocalizedDescriptionKey: "Некорректная ссылка"])
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let error = NSError(domain: "BadUrl", code: 0, userInfo: [NSLocalizedDescriptionKey: "Некорректная ссылка"])
                completion(.failure(error))
                
                return }
            do {
                let resultJson = try JSONDecoder().decode(DataType.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(resultJson))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
