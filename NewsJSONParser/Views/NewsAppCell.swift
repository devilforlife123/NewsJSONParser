//
//  NewsAppCell.swift
//  NewsJSONParser
//
//  Created by suraj poudel on 28/1/20.
//  Copyright © 2020 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

class NewsAppCell:UITableViewCell{
    
    var newsImage:UIImageView = UIImageView()
    var newsHeadline:UILabel = UILabel()
    var newsDescription:UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
     }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupViewsAndConstraints()
         
     }

     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
         
     }
     
     override func layoutSubviews() {
         super.layoutSubviews()
     
     }
    
     private func setupViewsAndConstraints(){
        // configure newsHeadline
        let marginGuide = contentView.layoutMarginsGuide
        
        contentView.addSubview(newsImage)
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsImage.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        newsImage.bottomAnchor.constraint(lessThanOrEqualTo: marginGuide.bottomAnchor,constant:5).isActive = true
        newsImage.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        newsImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        newsImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        contentView.addSubview(newsHeadline)
        newsHeadline.translatesAutoresizingMaskIntoConstraints = false
        newsHeadline.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor,constant: 10).isActive = true
        newsHeadline.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        newsHeadline.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        newsHeadline.numberOfLines = 0
        newsHeadline.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        
        // configure newsDescription
        contentView.addSubview(newsDescription)
        newsDescription.translatesAutoresizingMaskIntoConstraints = false
        newsDescription.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor,constant: 10).isActive = true
        newsDescription.bottomAnchor.constraint(lessThanOrEqualTo: marginGuide.bottomAnchor,constant: 5).isActive = true
        newsDescription.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        newsDescription.topAnchor.constraint(equalTo: newsHeadline.bottomAnchor).isActive = true
        newsDescription.numberOfLines = 0
        newsDescription.font = UIFont(name: "Avenir-Book", size: 15)
        newsDescription.textColor = UIColor.black
    }
    
    var model:NewsModel?{
           didSet{
               if let model = model{
                self.newsImage.image = UIImage(named: "placeholder")!
                self.newsHeadline.text = {
                    
                    let headline = model.title != "" ? model.title:"No headline"
                    return headline
                }()
                self.newsDescription.text = {
                    let description = model.description != "" ? model.description:"No Description"
                    return description
                }()
               }
           }
       }
    
}
