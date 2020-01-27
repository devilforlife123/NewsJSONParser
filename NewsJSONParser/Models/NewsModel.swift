//
//  NewsModel.swift
//  NewsJSONParser
//
//  Created by suraj poudel on 28/1/20.
//  Copyright © 2020 suraj poudel. All rights reserved.
//

import Foundation

class NewsModel{
    let imageURL:String
    let title:String
    let description:String
    
    init(withNews news:NewsArticle){
        self.imageURL = news.articleThumbnail ?? ""
        self.title = news.title ?? ""
        self.description = news.description ?? ""
    }
    
}

