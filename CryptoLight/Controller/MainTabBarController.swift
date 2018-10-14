//
//  MainTabBarController.swift
//  CryptoLight
//
//  Created by Richard Price on 29/09/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit


class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        UINavigationBar.appearance().prefersLargeTitles = true
        setupTabBar()
  
    }
    
    private func setupTabBar() {
        let layout = UICollectionViewFlowLayout()
        let coinLayout = UICollectionViewFlowLayout()
        let newsController = NewsController(collectionViewLayout: layout)
        let coinsController = CoinsController(collectionViewLayout: coinLayout)
        
        
        tabBar.tintColor = UIColor.rgb(red: 51, green: 212, blue: 128)
        tabBar.isTranslucent = true
        tabBar.barTintColor = .clear
        
        viewControllers = [
            generateNavController(with: newsController, title: "News", image:#imageLiteral(resourceName: "home_selected") ),
            generateNavController(with: coinsController, title: "Prices", image: #imageLiteral(resourceName: "profile_selected"))
        
        ]
    }
    
    private func generateNavController(with rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
        
    }
    
}
