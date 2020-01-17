//
//  ViewController.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 17/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var jsonData: Response?
    var pokemonTableView = UITableView()
    var buttonDescription = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStartString = "https://pokeapi.co/api/v2/ability/?limit=20&offset=20"
        pokemonTableView = UITableView(frame: view.frame)
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        view.addSubview(pokemonTableView)
        
        downloadInitialData(urlString: urlStartString) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let resultJson):
                self.jsonData = resultJson
            case .failure(let error):
                self.showAlert(errorValue: error.localizedDescription)
            }
            self.pokemonTableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pokemons = jsonData?.results else { return 20 }
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let pokemons = jsonData?.results {
            cell.textLabel?.text = pokemons[indexPath.row].name
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pokemons = jsonData?.results {
            let url = pokemons[indexPath.row].url
            print("Url " + url)
            downloadPokemonDetails(urlString: url, completion: { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let resultJson):
                    self.addDetailView(welcome: resultJson)
                case .failure(let error):
                    self.showAlert(errorValue: error.localizedDescription)
                }
            })
        }
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
