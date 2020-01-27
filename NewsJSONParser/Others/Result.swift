//
//  Result.swift
//  NewsJSONParser
//
//  Created by suraj poudel on 28/1/20.
//  Copyright © 2020 suraj poudel. All rights reserved.
//

import Foundation

enum Result<T>{
    case Success(T)
    case Error(String)
    case Failure(String)
}
