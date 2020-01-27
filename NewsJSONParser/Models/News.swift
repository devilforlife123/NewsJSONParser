//
//  News.swift
//  NewsJSONParser
//
//  Created by suraj poudel on 28/1/20.
//  Copyright © 2020 suraj poudel. All rights reserved.
//

import Foundation

struct News:Decodable{
    
    let title:String?
    let newsArticle:[NewsArticle]?
    
    enum CodingKeys:String,CodingKey{
        case title
        case newsArticle = "rows"
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.newsArticle = try container.decodeIfPresent([NewsArticle].self, forKey: .newsArticle)
        ?? nil
        
    }
}
