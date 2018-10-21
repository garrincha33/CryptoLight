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
            priceChange24Price.text = items?.percent_change_24h
            
            if (priceChange24Price.text?.contains("-"))! {
                priceChange24Price.textColor = .red
            } else {
                priceChange24Price.textColor = .green
            }
            
            marketCapPrice.text = items?.market_cap_usd
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
        label.font = UIFont(name: "Poppins-Light", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        let bottomLayerUser = CALayer()
        bottomLayerUser.frame = CGRect(x: 0, y: 36, width: 260, height: 0.5)
        bottomLayerUser.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 175/255, alpha: 1).cgColor
        label.layer.addSublayer(bottomLayerUser)
        return label
    }()
    
    fileprivate let priceChange24Title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "24 Hour Price"
        label.font = UIFont(name: "Poppins-Light", size: 16)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    fileprivate let priceChange24Price: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont(name: "Poppins-Light", size: 14)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    
    fileprivate let marketCapTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Market Cap"
        label.font = UIFont(name: "Poppins-Light", size: 16)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    fileprivate let marketCapPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont(name: "Poppins-Light", size: 14)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
        setupLayout()
        
    }
    
    fileprivate func setupLayout() {
        view.addSubview(backgroundContainer)
        backgroundContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 220, height: 400)
        view.addSubview(cryptoTitle)
        cryptoTitle.anchor(top: backgroundContainer.topAnchor, left: backgroundContainer.leftAnchor, bottom: nil, right: backgroundContainer.rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        let stackView = UIStackView(arrangedSubviews: [priceChange24Title, priceChange24Price])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.anchor(top: cryptoTitle.bottomAnchor, left: backgroundContainer.leftAnchor, bottom: nil, right: backgroundContainer.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        let stackViewMarketCap = UIStackView(arrangedSubviews: [marketCapTitle, marketCapPrice])
        stackViewMarketCap.axis = .horizontal
        stackViewMarketCap.distribution = .fillEqually
        stackViewMarketCap.spacing = 10
        stackViewMarketCap.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackViewMarketCap)
        
        stackViewMarketCap.anchor(top: stackView.bottomAnchor, left: backgroundContainer.leftAnchor, bottom: nil, right: backgroundContainer.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        
        
//
//        view.addSubview(priceChange24Price)
//        priceChange24Price.anchor(top: cryptoTitle.bottomAnchor, left: backgroundContainer.leftAnchor, bottom: nil, right: backgroundContainer.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
//        view.addSubview(priceChange24Title)
//        priceChange24Title.anchor(top: cryptoTitle.bottomAnchor, left: backgroundContainer.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 250, height: 50)
        
    }
}
