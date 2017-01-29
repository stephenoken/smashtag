//
//  TwitterQueryBuilder.swift
//  Smashtag
//
//  Created by Stephen O'Kennedy on 28/12/2016.
//  Copyright © 2016 Stephen O'Kennedy. All rights reserved.
//

import Foundation
//enum TwitterQueryBuilder {
////    "https://api.twitter.com/1.1/search/tweets.json"
//    case searchTweetsByHashtags([String])
//    
//    
//    var baseDescription :String {
//        switch self {
//        case .searchTweetsByHashtags:
//          return "\(BASE_URL)/search/tweets.json"
//        }
//    }
//}


private let TWITTER_BASE_URL = "https://api.twitter.com/1.1"
private let TWITTER_SEARCH_URL = "\(TWITTER_BASE_URL)/search/tweets.json?q="
public enum TwitterApi : Path {
    
    public typealias Params = [String]
    case Search(Params)
    
     var path: String {
        switch self {
        case .Search(let params) : return "\(TWITTER_SEARCH_URL)\(params.map(percentEncodeParam).joined(separator: ""))"
        }
    }
}

private func percentEncodeParam(param: String) -> String {
    return param.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
}

protocol Path {
    var path : String {get}
}
