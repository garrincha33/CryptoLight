//
//  NewsController.swift
//  CryptoLight
//
//  Created by Richard Price on 09/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit

class NewsController: BaseCollectionViewController<CustomNewsControllerCell, NewsArticles>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        items = [NewsArticles]()
        fetchArticles()
        collectionView?.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
  
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (view.frame.width - 3 * 8) / 2 + 155
            return CGSize(width: width, height: width - 70)
        }

    fileprivate func fetchArticles() {
        APIService.shared.fetchArticlesFromApi { (articles) in
            self.items = articles
            self.collectionView.reloadData()
        }
    }
}
