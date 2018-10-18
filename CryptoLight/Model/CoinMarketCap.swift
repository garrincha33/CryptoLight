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
//    var rank: String?
    var id: String?
    var price_usd: String?
//    var market_cap_usd: String?
//    var available_supply: String?
//    var total_supply: String?
//    var max_supply: String?
//    var percent_change_1h: String?
//    var percent_change_24h: String?
//    var percent_change_7d: String?

    enum CodingKeys: String, CodingKey {
        case name
        case symbol
        case price_usd
        case id
//        case market_cap_usd
    }
    //urlToImage = [try values.decode(String.self, forKey: .urlToImage)]
}

//struct CoinsResults: Decodable {
//    var coins: [CoinMarketCap]
//}

//extension CoinMarketCap: Decodable {
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        //name = [try values.decode(String.self, forKey: .name)]
//    }





