//
//  CoinsController.swift
//  CryptoLight
//
//  Created by Richard Price on 14/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit
import Alamofire

class CoinsController: BaseCollectionViewController<CustomCoinControllerCell, CoinMarketCap>, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        items = [CoinMarketCap]()
        fetchCoins()
        collectionView?.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2 * 16) / 2 + 8
        return CGSize(width: width + 150, height: width - 70)
    }
    
    fileprivate func fetchCoins() {
        APIService.shared.fetchCoinsFromApi { (coins) in
            for _ in coins {
                self.items = coins
                self.collectionView.reloadData()
            }
        }
    }
}
