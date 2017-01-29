//
//  TwitterClientTests.swift
//  Smashtag
//
//  Created by Stephen O'Kennedy on 27/12/2016.
//  Copyright © 2016 Stephen O'Kennedy. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftyJSON

class TwitterClientTests: QuickSpec {
    
    override func spec() {
        describe("TwitterClient Response") {
            it("should return a successful response for when searching with one tags") {
                //https://api.twitter.com/1.1/search/tweets.json
                let testResponse = MockClient.query(TwitterApi.Search(["#RogueOne"]))
                let sampleText = "ローグ・ワンみたよ！！！！！\nチアルートがかっこよい😂\nhttps://t.co/grbVEbpIfZ\n#RogueOne #ローグワン ＃ドニー・イェン https://t.co/HP0tDaKQZq"
                expect(testResponse["errors"]).to(beEmpty())
                expect(testResponse["statuses"]).toNot(beEmpty())
                expect(testResponse["statuses"].arrayValue.first?["text"].stringValue).to(equal(sampleText))
            }
            
            it("should return a successful response for when searching with multiple tags") {
                //https://api.twitter.com/1.1/search/tweets.json
                let testResponse = MockClient.query(TwitterApi.Search(["#RogueOne","#Tarkin"]))
                let sampleText = "**REACTIONS TO #STARWARS #ROGUEONE , #CGI #TARKIN ~Actors seek posthumous protections after big-screen resurrections https://t.co/dDhafkJneJ"
                expect(testResponse["errors"]).to(beEmpty())
                expect(testResponse["statuses"]).toNot(beEmpty())
                expect(testResponse["statuses"].arrayValue.first?["text"].stringValue).to(equal(sampleText))
            }
            
            it("should return an error response for when searching with an invlaid tag") {
                //https://api.twitter.com/1.1/search/tweets.json
                let testResponse = MockClient.query(TwitterApi.Search(["#TagDoesntExist"]))
                expect(testResponse["statuses"]).to(beEmpty())
            }
        }
    }
}
