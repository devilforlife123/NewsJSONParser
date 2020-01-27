//
//  UIImage+Extensions.swift
//  NewsJSONParser
//
//  Created by suraj poudel on 28/1/20.
//  Copyright © 2020 suraj poudel. All rights reserved.
//

import Foundation
import UIKit


let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
  func downloadImage(from imgURL: String) -> URLSessionDownloadTask? {
    
    var task:URLSessionDownloadTask? = nil
    
      guard let url = URL(string: imgURL) else { return nil }

      if let imageToCache = imageCache.object(forKey: imgURL as NSString) {
        GCD.runOnMainThread {
            self.image = imageToCache
        }
        return nil
      }
    
    GCD.runAsync {
        task = URLSession.shared.downloadTask(with: url) { (url, response, error) in
            if let err = error {
                print(err)
                return
            }
            GCD.runOnMainThread {
                if error == nil, let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data){
                    imageCache.setObject(image, forKey: imgURL as NSString)
                    self.image = image
                }else{
                    let placeholderImage = UIImage(named:"placeholder")!
                    imageCache.setObject(placeholderImage, forKey: imgURL as NSString)
                    self.image = placeholderImage
                }
            }

        }
        
        task?.resume()
    }

    
    return task
     
  }
}
