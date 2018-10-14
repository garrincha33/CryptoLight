//
//  CoinMarketCap.swift
//  CryptoLight
//
//  Created by Richard Price on 13/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import Foundation

struct CoinMarketCap: Decodable {

    let name: String?
    let symbol: String?
    let rank: String?
    let price_usd: String?
    let market_cap_usd: String?
    let available_supply: String?
    let total_supply: String?
    let max_supply: String?
    let percent_change_1h: String?
    let percent_change_24h: String?
    let percent_change_7d: String?

    
    
    
}


