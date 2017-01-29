//
//  TwitterClient.swift
//  Smashtag
//
//  Created by Stephen O'Kennedy on 16/12/2016.
//  Copyright © 2016 Stephen O'Kennedy. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import OAuthSwift
import OAuthSwiftAlamofire

public class Client : ApiConnecter  {
    
    typealias ReturnType = JSON
    
    static func query(_ query: Path) -> JSON {
        return JSON("{}")
    }
    
    static private let BASE_URL = "https://api.twitter.com/1.1/search/tweets.json"
    static private func buildOauth() -> OAuth1Swift {
        let path = Bundle.main.path(forResource: "twitter_credentials", ofType: "do_not_commit")
        let data = try? NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe)
        let baseCredentials  = JSON(data: data as! Data)
        
        return OAuth1Swift(
            consumerKey: baseCredentials["oauth_consumer_key"].stringValue,
            consumerSecret: baseCredentials["oauth_token"].stringValue,
            requestTokenUrl: "https://api.twitter.com/oauth/request_token",
            authorizeUrl: "https://api.twitter.com/oauth/authorize",
            accessTokenUrl: "https://api.twitter.com/oauth/access_token"
        )
    }
}
