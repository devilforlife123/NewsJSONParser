//
//  NewsArticle.swift
//  NewsJSONParser
//
//  Created by suraj poudel on 28/1/20.
//  Copyright © 2020 suraj poudel. All rights reserved.
//

import Foundation

struct NewsArticle:Decodable{
    
    let title: String?
    let description: String?
    let articleThumbnail: String?
    
    enum CodingKeys:String,CodingKey{
         case title
         case description
         case articleThumnail = "imageHref"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
                   ?? nil
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        ?? nil
        self.articleThumbnail = try container.decodeIfPresent(String.self, forKey: .articleThumnail)
        ?? nil
        
    }
}
