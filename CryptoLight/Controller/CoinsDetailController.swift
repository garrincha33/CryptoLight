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
            priceChange24Price.text = "\("%")\(items?.percent_change_24h ?? "") "
            
            if (priceChange24Price.text?.contains("-"))! {
                priceChange24Price.textColor = .red
            } else {
                priceChange24Price.textColor = .green
            }
            marketCapPrice.text = "\(convertToCurrency((items?.market_cap_usd)!))"
            currentPrice.text = "\(convertToCurrency((items?.price_usd)!))".trunc(length: 5)
            
            priceChange1Hour.text = "\("%")\(items?.percent_change_1h ?? "") "
            
            if (priceChange1Hour.text?.contains("-"))! {
                priceChange1Hour.textColor = .red
            } else {
                priceChange1Hour.textColor = .green
            }
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
    
    fileprivate let currentPriceTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Current Price"
        label.font = UIFont(name: "Poppins-Light", size: 16)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    fileprivate let currentPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont(name: "Poppins-Light", size: 14)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    fileprivate let priceChange1HourTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Last Hour Price"
        label.font = UIFont(name: "Poppins-Light", size: 16)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    fileprivate let priceChange1Hour: UILabel = {
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
    
    override func viewWillAppear(_ animated: Bool) {
        cryptoTitle.alpha = 0.0
        marketCapTitle.alpha = 0.0
        priceChange24Title.alpha = 0.0
        currentPriceTitle.alpha = 0.0
        priceChange1HourTitle.alpha = 0.0
        priceChange24Price.alpha = 0.0
        marketCapPrice.alpha = 0.0
        currentPrice.alpha = 0.0
        priceChange1Hour.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, delay: 0.9, options: [], animations: {
            self.cryptoTitle.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 0.9, delay: 1.5, options: [], animations: {
            self.priceChange24Title.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 1.1, delay: 1.7, options: [], animations: {
            self.marketCapTitle.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 1.2, delay: 1.9, options: [], animations: {
            self.currentPriceTitle.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 1.3, delay: 2.1, options: [], animations: {
            self.priceChange1HourTitle.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 0.9, delay: 1.5, options: [], animations: {
            self.priceChange24Price.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 1.1, delay: 1.7, options: [], animations: {
            self.marketCapPrice.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 1.2, delay: 1.9, options: [], animations: {
            self.currentPrice.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 1.3, delay: 2.1, options: [], animations: {
            self.priceChange1Hour.alpha = 1.0
        }, completion: nil)
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
        
        let stackViewCurrentPrice = UIStackView(arrangedSubviews: [currentPriceTitle, currentPrice])
        stackViewCurrentPrice.axis = .horizontal
        stackViewCurrentPrice.distribution = .fillEqually
        stackViewCurrentPrice.spacing = 10
        stackViewCurrentPrice.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackViewCurrentPrice)
        stackViewCurrentPrice.anchor(top: stackViewMarketCap.bottomAnchor, left: backgroundContainer.leftAnchor, bottom: nil, right: backgroundContainer.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        let stackViewLastHour = UIStackView(arrangedSubviews: [priceChange1HourTitle, priceChange1Hour])
        stackViewLastHour.axis = .horizontal
        stackViewLastHour.distribution = .fillEqually
        stackViewLastHour.spacing = 10
        stackViewLastHour.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackViewLastHour)
        stackViewLastHour.anchor(top: stackViewCurrentPrice.bottomAnchor, left: backgroundContainer.leftAnchor, bottom: nil, right: backgroundContainer.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
    }
    
    // converting number to currency
    fileprivate func convertToCurrency(_ number: String) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        let numberDouble = Double(number)!
        if numberDouble >= 1000 {
            //numberString = convertToCurrency(number: numberDouble)
            let priceOfCoin: NSNumber = numberDouble as NSNumber
            let priceString = currencyFormatter.string(from: priceOfCoin)!
            return priceString
        }
        return "$\(number)"
    }
}
