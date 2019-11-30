//
//  AppDelegate.swift
//  MVC-IOS
//
//  Created by mohamed albohy on 11/30/17.
//  Copyright © 2017 Mohamed Elbohy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let favoriteModel = FavoriteModel()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let viewControllers = (window?.rootViewController as? UITabBarController)?.viewControllers {
            for value in viewControllers.enumerated() {
                switch value {
                case let (0, nc as UINavigationController):
                    let searchVC = SearchViewController(searchModel: .init(), favoriteModel: favoriteModel)
                    nc.setViewControllers([searchVC], animated: false)

                case let (1, nc as UINavigationController):
                    let favoriteVC = FavoriteViewController(favoriteModel: favoriteModel)
                    nc.setViewControllers([favoriteVC], animated: false)

                default:
                    continue
                }
            }
        }
        
        return true
    }
}

