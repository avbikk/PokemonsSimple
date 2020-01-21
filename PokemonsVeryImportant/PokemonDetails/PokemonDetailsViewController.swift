//
//  PokemonDetails.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 18/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import Foundation
import UIKit


protocol PokemonDetailsViewProtocol: AnyObject {

    func showPokemonDetails(data: Welcome?)
    func showAlert(errorValue: String)
}

class PokemonDetailsViewController: UIViewController, PokemonDetailsViewProtocol {
    
    let assembly = PokemonDetailsAssembly()
    var presenter: PokemonDetailsPresenterProtocol?
    
    var pokemonsDetailsData: Welcome?
    var pokemonsDetailsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        presenter?.configureView()
        navigationItem.title = "Информация о покемоне"
    }
    
    // MARK: - PokemonDetailsViewProtocol methods
    func showAlert(errorValue: String) {
        let alertController = UIAlertController(title: "Ошибка загрузки", message: errorValue, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    func showPokemonDetails(data: Welcome?) {
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
