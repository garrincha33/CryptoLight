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
        let newsController = NewsController(collectionViewLayout: layout)
        
        viewControllers = [
            generateNavController(with: newsController, title: "Home", image:#imageLiteral(resourceName: "home_selected") ),
            generateNavController(with: ViewController(), title: "Profile", image: #imageLiteral(resourceName: "profile_selected"))
        
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
