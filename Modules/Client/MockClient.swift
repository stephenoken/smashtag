//
//  MockTwitterClient.swift
//  Smashtag
//
//  Created by Stephen O'Kennedy on 31/12/2016.
//  Copyright © 2016 Stephen O'Kennedy. All rights reserved.
//

import Foundation
import SwiftyJSON
import Regex

public class MockClient : ApiConnecter {

    typealias ReturnType = JSON
    static func query(_ query : Path) -> ReturnType {
        let urlPath = query.path
        let regex = Regex("\\?q=(.*)")
        
        let result = regex.match(urlPath)?.captures[0]
        let filePath = Bundle.main.path(forResource: result, ofType: "json", inDirectory: "Mock_Responses")
        let invalidFilePath = Bundle.main.path(forResource: "InvalidRequest", ofType: "json", inDirectory: "Mock_Responses")!
        let fileData = try? Data(contentsOf: URL(fileURLWithPath: filePath ?? invalidFilePath))
        
        
//        let paths = Bundle.main.paths(forResourcesOfType: "json", inDirectory: "Mock_Responses")
//        
//        let r = result!
//        let file = paths.filter {$0.contains(r)}
//        
//        let fileData = try? Data(contentsOf: URL(fileURLWithPath: file[0]))
        let fileContents = String.init(data: fileData!, encoding: .utf8)!
        return JSON.parse(fileContents)
    }
}
