//
//  CoinsController.swift
//  CryptoLight
//
//  Created by Richard Price on 14/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit
import Alamofire

class CoinsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let coins = [CoinMarketCap]()
    
    let coinsDummy = [
            CoinMarketCap(name: "Bitcoin", symbol: "BTC", rank: nil, price_usd: "\(555)", market_cap_usd: nil, available_supply: nil, total_supply: nil, max_supply: nil, percent_change_1h: nil, percent_change_24h: "\(0.02)", percent_change_7d: nil),
            CoinMarketCap(name: "Etherrum", symbol: "ETH", rank: nil, price_usd: "\(400)", market_cap_usd: nil, available_supply: nil, total_supply: nil, max_supply: nil, percent_change_1h: nil, percent_change_24h: "\(0.12)", percent_change_7d: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
        collectionView.register(CustomCoinControllerCell.self, forCellWithReuseIdentifier: "cellId")
        transparentNavBar()
        collectionView.layoutIfNeeded()
   
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CustomCoinControllerCell
   
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        UIView.animate(withDuration: 0.9, animations: { () -> Void in
        cell.alpha = 1
        cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)})
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coinsDummy.count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 2 * 16) / 2 + 8
        return CGSize(width: width + 150, height: width - 70)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
        
    }

    
    
    
    fileprivate func transparentNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    
}
