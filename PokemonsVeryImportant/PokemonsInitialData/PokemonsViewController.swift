//
//  PokemonsInitialDataViewController.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 17/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit

protocol PokemonsInitialDataViewInput: AnyObject {

    func showInitialPokemonData(pokemonsDownloadedList: [PokemonsList]?)
    func reloadPokemonsData(pokemonsDownloadedList: [PokemonsList]?)
    func showAlert(with message: String)
}

protocol PokemonsInitialDataViewOutput: AnyObject {

    func viewIsReady()
    func showNextPagePokemonsData()
    func pokemonDetailsTapped(url: String)
}

class PokemonsInitialDataViewController: UIViewController, PokemonsInitialDataViewInput {
    
    var output: PokemonsInitialDataViewOutput?

    private var pokemonsList: [PokemonsList]?
    
    private var pokemonsTableView = UITableView()
    private var buttonDescription = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        navigationItem.title = "Список покемонов"
        output?.viewIsReady()
    }
    
    func showInitialPokemonData(pokemonsDownloadedList: [PokemonsList]?) {
        pokemonsList = pokemonsDownloadedList
        pokemonsTableView = UITableView(frame: view.frame)
        pokemonsTableView.delegate = self
        pokemonsTableView.dataSource = self
        view.addSubview(pokemonsTableView)
    }
    
    func reloadPokemonsData(pokemonsDownloadedList: [PokemonsList]?) {
        guard let pokemonsDownloadedList = pokemonsDownloadedList else { return }
        pokemonsList?.append(contentsOf: pokemonsDownloadedList)
        pokemonsTableView.reloadData()
    }

    func showAlert(with message: String) {
        let alertController = UIAlertController(title: "Ошибка загрузки", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}


extension PokemonsInitialDataViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pokemons = pokemonsList else { return 20 }
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let pokemons = pokemonsList {
            cell.textLabel?.text = String(indexPath.row) + " " + pokemons[indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let pokemonsList = pokemonsList else { return }
        guard indexPath.row == pokemonsList.count-1 else { return }
        output?.showNextPagePokemonsData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pokemons = pokemonsList {
            output?.pokemonDetailsTapped(url: pokemons[indexPath.row].url)
        }
    }
}

