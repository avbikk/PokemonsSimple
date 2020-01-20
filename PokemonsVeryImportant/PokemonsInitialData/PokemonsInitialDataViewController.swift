//
//  PokemonsInitialDataViewController.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 17/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit

protocol PokemonsInitialDataViewProtocol: AnyObject {

    func showAlert(errorValue: String)
    func showInitialPokemonData(data: Response?)
    func reloadPokemonsData(data: Response?)
    
}

class PokemonsInitialDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PokemonsInitialDataViewProtocol {
    
    let assembly = PokemonsAssembly()
    var presenter: PokemonsPresenterProtocol?
    
    var initialPokemonsData: Response?
    
    var pokemonsTableView = UITableView()
    var buttonDescription = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        presenter?.configureView()
        navigationItem.title = "Список покемонов"
    }
    
    func showInitialPokemonData(data: Response?) {
        initialPokemonsData = data
        pokemonsTableView = UITableView(frame: view.frame)
        pokemonsTableView.delegate = self
        pokemonsTableView.dataSource = self
        view.addSubview(pokemonsTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pokemons = initialPokemonsData?.results else { return 20 }
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let pokemons = initialPokemonsData?.results {
            cell.textLabel?.text = String(indexPath.row) + " " + pokemons[indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let initialPokemonsData = initialPokemonsData else { return }
        guard indexPath.row == initialPokemonsData.results.count-1 else { return }
        presenter?.showInitialPokemonsDataNextPage()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pokemons = initialPokemonsData?.results {
            presenter?.pokemonDetailsTapped(url: pokemons[indexPath.row].url)
        }
    }
    
    func reloadPokemonsData(data: Response?) {
        guard  let data = data else { return }
        initialPokemonsData?.results.append(contentsOf: data.results)
        pokemonsTableView.reloadData()
    }
    func showAlert(errorValue: String) {
        let alertController = UIAlertController(title: "Ошибка загрузки", message: errorValue, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }

}
