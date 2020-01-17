//
//  Service.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 17/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation

typealias InitialDataHandler = (Result<Response, Error>) -> ()

func downloadInitialData(urlString: String, completion: @escaping InitialDataHandler) {
    
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else { return }
        guard String(data: data, encoding: .utf8) != nil else { return }        
        /// Decoding
        DispatchQueue.main.async {
            do {
                let resultJson = try JSONDecoder().decode(Response.self, from: data)
                completion(.success(resultJson))
            } catch let error {
                completion(.failure(error))
            }
        }
    }.resume()
}

