//
//  NewsConstant.swift
//  CryptoLight
//
//  Created by Richard Price on 11/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import Foundation

// Full URL: https://newsapi.org/v2/everything?sources=crypto-coins-news&apiKey=199e8836528a49c1848b82bd93e26341
// Full URL Headlines https://newsapi.org/v2/top-headlines?country=us&apiKey=199e8836528a49c1848b82bd93e26341

struct NewsConstant {
    
    struct BaseApi {
        static let scheme = "https"
        static let host = "newsapi.org"
        static let path = "/v2/everything"
    }
    
    struct MethodParameters {
        static let sources = "sources"
        static let apiKey = "apiKey"
    }
    
    struct MethodValue {
        static let sources = "crypto-coins-news"
        static let apiKey = "199e8836528a49c1848b82bd93e26341"
    }
    
    
}
