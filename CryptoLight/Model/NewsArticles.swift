//
//  NewsArticles.swift
//  CryptoLight
//
//  Created by Richard Price on 11/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import Foundation

struct NewsArticles {
    
    var title: String?
    var url: String?
    var urlToImage: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case url
        case urlToImage
    }
}


struct SearchResults: Decodable {
    let totalResults: Int
    let articles: [NewsArticles]
}

extension NewsArticles: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        url = try values.decode(String.self, forKey: .url)
        urlToImage = try values.decode(String.self, forKey: .urlToImage)
    }
}
