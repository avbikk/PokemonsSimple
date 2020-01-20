//
//  SceneDelegate.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 17/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let pokemonsInitialDataViewController = PokemonsAssembly.configure()
            let navigationController = UINavigationController(rootViewController: pokemonsInitialDataViewController)
            window.rootViewController = navigationController
            pokemonsInitialDataViewController.view.backgroundColor = .red
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

