//
//  AppDelegate.swift
//  Shudder Demo
//
//  Created by Sam on 11/7/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController = NavigationController(rootViewController: MainViewController())

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.rootViewController = navigationController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()

        return true
    }

    func setupAppearance() {
        let appearance = UINavigationBar.appearance()
        appearance.barTintColor = Colors.featuredTextGray
        appearance.tintColor = Colors.featuredTextGray

        appearance.isTranslucent = true

        appearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor: Colors.featuredTextGray]
    }
}

