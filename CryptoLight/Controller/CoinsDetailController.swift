//
//  CoinsDetailController.swift
//  CryptoLight
//
//  Created by Richard Price on 18/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit

class CoinsDetailController: UIViewController {

    var coinDetails = [CoinMarketCap]()
    
    var items: CoinMarketCap? {
        didSet {
            
            navigationItem.title = items?.id
            cryptoTitle.text = items?.symbol
            
        }
    }
    
    let backgroundContainer: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        view.layer.opacity = 0.1
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    fileprivate let cryptoTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont(name: "Poppins-ThinItalic", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        let bottomLayerUser = CALayer()
        bottomLayerUser.frame = CGRect(x: 0, y: 34, width: 252, height: 0.5)
        bottomLayerUser.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 175/255, alpha: 1).cgColor
        label.layer.addSublayer(bottomLayerUser)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
        setupLayout()
        
    }
    
    fileprivate func setupLayout() {
        view.addSubview(backgroundContainer)
        backgroundContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 200, height: 400)
        view.addSubview(cryptoTitle)
        cryptoTitle.anchor(top: backgroundContainer.topAnchor, left: backgroundContainer.leftAnchor, bottom: nil, right: backgroundContainer.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
    }
}
