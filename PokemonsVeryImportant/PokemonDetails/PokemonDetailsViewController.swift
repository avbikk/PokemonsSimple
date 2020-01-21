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

    func showPokemonDetails(data: PokemonDetails?)
    func showAlert(with message: String)
}


protocol PokemonDetailsViewOutput: AnyObject {
    
    func viewIsReady()
}

class PokemonDetailsViewController: UIViewController, PokemonDetailsViewInput {
    
    var presenter: PokemonDetailsViewOutput?
    
    var pokemonsDetailsData: PokemonDetails?
    var pokemonsDetailsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        navigationItem.title = "Информация о покемоне"
        presenter?.viewIsReady()
    }
    
    func showAlert(with message: String) {
        let alertController = UIAlertController(title: "Ошибка загрузки", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    func showPokemonDetails(data: PokemonDetails?) {
        guard let data = data else { return }
        if (pokemonsDetailsData == nil) {
            pokemonsDetailsData = data
        }
        
        pokemonsDetailsLabel = UILabel(frame: CGRect(x: 50, y: 100, width: 400, height: 400))
        pokemonsDetailsLabel.tintColor = .black
        pokemonsDetailsLabel.font = UIFont(name: "Arial", size: 25)
        pokemonsDetailsLabel.text = "Id = " + String(data.id) + " \nName = " + data.name + " \nisMainSeries = " + String(data.isMainSeries)
        pokemonsDetailsLabel.lineBreakMode = NSLineBreakMode.byTruncatingMiddle;
        pokemonsDetailsLabel.numberOfLines = 10
        view.addSubview(pokemonsDetailsLabel)
    }
}
