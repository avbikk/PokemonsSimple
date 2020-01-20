//
//  InitialPokemonDataViewController.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 17/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit

protocol InitialPokemonDataViewProtocol: AnyObject {

    func showAlert(errorValue: String)
    func showInitialPokemonData(data: Response?)
    func reloadPokemonsData(data: Response?)
    
}


class InitialPokemonDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, InitialPokemonDataViewProtocol {
    
    let assembly: PokemonAssemblyProtocol = PokemonAssembly()
    var presenter: PokemonPresenterProtocol! = nil
    
    var initialPokemonsData: Response?
    
    var pokemonsTableView = UITableView()
    var buttonDescription = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assembly.configure(with: self)
        presenter.configureView()
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
        presenter.showInitialPokemonsDataNextPage()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pokemons = initialPokemonsData?.results {
            presenter.pokemonDetailsTapped(url: pokemons[indexPath.row].url)
        }
    }
    
    func reloadPokemonsData(data: Response?) {
        guard  let data = data else { return }
        initialPokemonsData?.results.append(contentsOf: data.results)
        pokemonsTableView.reloadData()
    }
    
    func addDetailView(welcome: Welcome) {
        buttonDescription.removeFromSuperview()
        let height: CGFloat = 150.0
        let width: CGFloat = 300.0
        buttonDescription = UIButton(frame: .zero)
        buttonDescription.layer.cornerRadius = 0.3 * height
        
        buttonDescription.backgroundColor = .red
        buttonDescription.tintColor = .black
        let title = "Id = " + String(welcome.id) + "\n name = " + welcome.name + "\nisMainSeries = " + String(welcome.isMainSeries)
        buttonDescription.setTitle(title, for: .normal)
        buttonDescription.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        view.addSubview(buttonDescription)

        /// Constraints
        buttonDescription.translatesAutoresizingMaskIntoConstraints = false
        buttonDescription.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonDescription.widthAnchor.constraint(equalToConstant: width).isActive = true
        buttonDescription.heightAnchor.constraint(equalToConstant: height).isActive = true
        buttonDescription.addTarget(self, action: #selector(removeButtonFromView), for: .touchUpInside)
    }
    
    func showAlert(errorValue: String) {
        let alertController = UIAlertController(title: "Ошибка загрузки", message: errorValue, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    @objc func removeButtonFromView() {
        buttonDescription.removeFromSuperview()
    }
}
