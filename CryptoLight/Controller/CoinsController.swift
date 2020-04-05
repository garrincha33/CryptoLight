//
//  CoinsController.swift
//  CryptoLight
//
//  Created by Richard Price on 14/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit
import Alamofire

class CoinsController: BaseCollectionViewController<CustomCoinControllerCell, CoinMarketCap>, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        items = [CoinMarketCap]()
        itemCopy = [CoinMarketCap]()
        
        searchBarSetup()
        collectionView?.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        fetchCoins()
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2 * 16) / 2 + 8
        return CGSize(width: width + 150, height: width - 70)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = CoinsDetailController()
        let coins = items[indexPath.row]
        controller.items = coins
        navigationController?.pushViewController(controller, animated: true)

    }
    
    fileprivate func searchBarSetup() {
        hideKeyboardWhenTappedAround()
        self.definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        //searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.sizeToFit()
        searchController.searchBar.placeholder = "enter the name of your currency"
        searchController.searchBar.tintColor = UIColor.rgb(red: 51, green: 212, blue: 128)
 
    }
    
    private func doSearch() {
        if let search = searchController.searchBar.text {
            items = (search.isEmpty) ? itemCopy : itemCopy.filter({$0.symbol?.localizedCaseInsensitiveContains(search) == true})
        }
        collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        doSearch()
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        doSearch()
    }

    fileprivate func fetchCoins() {
        APIService.shared.fetchCoinsFromApi { (coins) in
            for _ in coins {
                self.items = coins
                self.itemCopy = coins
                self.collectionView.reloadData()
            }
        }
    }
}
