//
//  NewsViewModel.swift
//  NewsJSONParser
//
//  Created by suraj poudel on 28/1/20.
//  Copyright © 2020 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

class NewsViewModel:NSObject{
    
  var newsArray = [NewsArticle]()
  var showAlert:((String)->())?
  var dataUpdated:(()->())?
  var titleTextConfigured:((String)->())?
         
    func fetchNews(completion:@escaping()->()){
        self.request { (news) in
            switch news{
            case .Success(let news):
                if let news = news{
                    self.titleTextConfigured?(news.title!)
                    self.newsArray.append(contentsOf: news.newsArticle ?? [])
                    self.dataUpdated?()
                }
                completion()
            case .Failure(let message):
                self.showAlert?(message)
                completion()
            case .Error(let error):
                self.showAlert?(error)
                completion()
            }
        }
       
    }
    
    func request(completion:@escaping (Result<News?>)->()){
        GCD.runAsync {
            NetworkManager.shared.getNews { (result) in
                          switch result{
                          case .Success(let responseData):
                              if let model = self.processResponse(responseData){
                                  return completion(.Success(model))
                                  
                              }else {
                                  return completion(.Failure(NetworkManager.errorMessage))
                              }
                          case .Failure(let message):
                              return completion(.Failure(message))
                          case .Error(let error):
                              return completion(.Failure(error))
                          }
                      }
            }
       }
    
    func processResponse(_ data:Data)->News?{
           do {
               let decoder = JSONDecoder()
               let newsData = try decoder.decode(News.self, from: data)
               return newsData
               
           } catch let err {
               print("Err", err)
               return nil
           }

       }
}
