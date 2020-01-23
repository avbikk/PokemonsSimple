//
//  PokemonDetails.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 18/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation
import UIKit


protocol PokemonDetailsViewInput: AnyObject {

    func showPokemonDetails(data: PokemonDetails)
    func showAlert(with message: String)
}


protocol PokemonDetailsViewOutput: AnyObject {
    
    func viewIsReady()
}

class PokemonDetailsViewController: UIViewController, PokemonDetailsViewInput {
    
    var output: PokemonDetailsViewOutput?
    
    private var pokemonsDetailsData: PokemonDetails?
    private let pokemonsDetailsLabel = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Информация о покемоне"
        output?.viewIsReady()
    }
    
    func showAlert(with message: String) {
        let alertController = UIAlertController(title: "Ошибка загрузки", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    func showPokemonDetails(data: PokemonDetails) {
        if (pokemonsDetailsData == nil) {
            pokemonsDetailsData = data
        }
        
        pokemonsDetailsLabel.tintColor = .black
        pokemonsDetailsLabel.font = UIFont(name: "Arial", size: 25)
        pokemonsDetailsLabel.text = "Id = " + String(data.id) + " \nName = " + data.name + " \nisMainSeries = " + String(data.isMainSeries)
        pokemonsDetailsLabel.numberOfLines = 0
        view.addSubview(pokemonsDetailsLabel)
        pokemonsDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonsDetailsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pokemonsDetailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pokemonsDetailsLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        pokemonsDetailsLabel.heightAnchor.constraint(equalToConstant: 600).isActive = true
        
    }
}
