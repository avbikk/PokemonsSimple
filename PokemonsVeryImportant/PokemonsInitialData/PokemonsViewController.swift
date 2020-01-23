//
//  PokemonsInitialDataViewController.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 17/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit

protocol PokemonsInitialDataViewInput: UIViewController {

    func showInitialPokemonData(pokemonsDownloadedList: [PokemonsList])
    func reloadPokemonsData(pokemonsDownloadedList: [PokemonsList])
    func showAlert(with message: String)
}

protocol PokemonsInitialDataViewOutput: AnyObject {

    func viewIsReady()
    func didShowLastItem()
    func pokemonDetailsTapped(with urlString: String)
}

class PokemonsInitialDataViewController: UIViewController, PokemonsInitialDataViewInput {
    
    var output: PokemonsInitialDataViewOutput?

    private var pokemonsList: [PokemonsList] = []
    
    private var pokemonsTableView = UITableView()
    private var buttonDescription = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        navigationItem.title = "Список покемонов"
        pokemonsTableView = UITableView(frame: view.frame)
        pokemonsTableView.delegate = self
        pokemonsTableView.dataSource = self
        pokemonsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(pokemonsTableView)
        output?.viewIsReady()
    }
    
    func showInitialPokemonData(pokemonsDownloadedList: [PokemonsList]) {
        pokemonsList = pokemonsDownloadedList
        pokemonsTableView.reloadData()
    }
    
    func reloadPokemonsData(pokemonsDownloadedList: [PokemonsList]) {
        pokemonsList.append(contentsOf: pokemonsDownloadedList)
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
        return pokemonsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row) + " " + pokemonsList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.row == pokemonsList.count-1 else { return }
        output?.didShowLastItem()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output?.pokemonDetailsTapped(with: pokemonsList[indexPath.row].url)
    }
}

