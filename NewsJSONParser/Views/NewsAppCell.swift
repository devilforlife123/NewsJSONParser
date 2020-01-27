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
    var downloadTask: URLSessionDownloadTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
     }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
         
         
     }

     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
         
     }
     
     override func layoutSubviews() {
         super.layoutSubviews()
     
     }
    
}
