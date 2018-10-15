//
//  CustomCoinControllerCell.swift
//  CryptoLight
//
//  Created by Richard Price on 14/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit

class CustomCoinControllerCell: BaseCell<CoinMarketCap> {
    
    fileprivate let titleContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    let name: UILabel = {
        let lable = UILabel()
        lable.text = "Bitcoin"
        return lable
    }()
    
    let symbol: UILabel = {
        let lable = UILabel()
        lable.text = "BTC"
        return lable
    }()
    
    override var item: CoinMarketCap! {
        didSet {
            
            //code for setup
            
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        setupCoinsView()
        
    }
    
    fileprivate func setupCoinsView() {
        
        addSubview(titleContainer)
        titleContainer.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 50, paddingRight: 0, width: 150, height: 100)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
}


