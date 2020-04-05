//
//  CoinMarketCap.swift
//  CryptoLight
//
//  Created by Richard Price on 13/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import Foundation

struct CoinMarketCap: Decodable {

    var name: String?
    var symbol: String?
    var rank: Int?
    var id: String?
    var price_usd: String?
    var market_cap_usd: String?
    var percent_change_1h: String?
    var percent_change_24h: String?
    var percent_change_7d: String?

//    enum CodingKeys: String, CodingKey {
//        case name
//        case symbol
//        case price_usd
//        case id
//        case percent_change_24h
//        case market_cap_usd
//        case percent_change_1h
//        case rank
//    }
    //urlToImage = [try values.decode(String.self, forKey: .urlToImage)]
}

struct SearchResultsCoins: Decodable {
    let data: [CoinMarketCap]
}





