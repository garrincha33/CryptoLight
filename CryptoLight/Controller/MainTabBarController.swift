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
        setupNavigationBarCustomisation()
        setupTabBar()
    }
    
    private func setupNavigationBarCustomisation() {
        UINavigationBar.appearance().prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.blue,
             NSAttributedString.Key.font: UIFont(name: "Poppins-Light", size: 15) ??
                UIFont.systemFont(ofSize: 30)]
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
            generateNavController(with: newsController, title: "News", image: #imageLiteral(resourceName: "cryptoNews.png")),
            generateNavController(with: coinsController, title: "Prices", image: #imageLiteral(resourceName: "prices_new")  )
            
        
        ]
        
        //modify tab bar insets
        guard let items = tabBar.items else {return}
        for item in items {
            item.title = ""
            item.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        }
    }
    
    private func generateNavController(with rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
        
    }
    
}
