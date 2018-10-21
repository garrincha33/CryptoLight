//
//  CustomCoinControllerCell.swift
//  CryptoLight
//
//  Created by Richard Price on 14/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit

class CustomCoinControllerCell: BaseCell<CoinMarketCap> {

    let symbol: UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name:"Poppins-Bold",size:40)
        lable.textColor = .white
        return lable
    }()
    
    let currentPrice: UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Poppins-Light", size: 20)
        lable.textColor = .green
        return lable
    }()
    
    override var item: CoinMarketCap! {
        didSet {
            
            //code for render
            symbol.text = item.symbol
            currentPrice.text = "\(convertToCurrency((item?.price_usd)!))".trunc(length: 8)
            
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        setupCoinsView()
        
    }
    
    fileprivate func setupCoinsView() {
        
        addSubview(titleContainer)
        titleContainer.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 50, paddingRight: 0, width: 150, height: 100)
        addSubview(symbol)
        symbol.anchor(top: titleContainer.topAnchor, left: titleContainer.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addSubview(currentPrice)
        currentPrice.anchor(top: titleContainer.topAnchor, left: symbol.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 30, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
    
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


