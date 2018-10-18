//
//  APIService.swift
//  CryptoLight
//
//  Created by Richard Price on 13/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    static let shared = APIService()
    
    func fetchArticlesFromApi(completionHandler: @escaping ([NewsArticles]) -> ()) {
        let url = FULL_URLS
        Alamofire.request(url).response { (dataResponse) in
            if let err = dataResponse.error {
                print("unable to contact host", err)
                return
            }
            guard let data = dataResponse.data else {return}
            do {
                let searchResult = try
                    JSONDecoder().decode(SearchResults.self, from: data)
                print("Total Results:-", searchResult.totalResults)
                completionHandler(searchResult.articles)
            } catch let error {
                print("unable to decode", error)
            }
        }
    }
    
    func fetchCoinsFromApi(completionHandler: @escaping ([CoinMarketCap]) -> ()) {
        let url = FULL_COINS
        Alamofire.request(url).response { (dataResponse) in
            if let err = dataResponse.error {
                print("unable to contact host", err)
                return
            }
            guard let data = dataResponse.data else {return}
            do {
                let searchResult = try
                    JSONDecoder().decode([CoinMarketCap].self, from: data)
                completionHandler(searchResult)
                
            } catch let error {
                print("unable to decode", error)
            }
        }
    }
}
