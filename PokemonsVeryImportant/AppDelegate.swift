//
//  AppDelegate.swift
//  PokemonsVeryImportant
//
//  Created by Alsu Bikkulova on 17/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let pokemonsInitialDataViewController = Assembly.configure()
        let navigationController = UINavigationController(rootViewController: pokemonsInitialDataViewController)
        window?.rootViewController = navigationController
        pokemonsInitialDataViewController.view.backgroundColor = .red
        window?.makeKeyAndVisible()

        return true
    }
}

