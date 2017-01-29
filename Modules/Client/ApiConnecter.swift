//
//  ApiProtocol.swift
//  Smashtag
//
//  Created by Stephen O'Kennedy on 02/01/2017.
//  Copyright © 2017 Stephen O'Kennedy. All rights reserved.
//

import Foundation

protocol ApiConnecter {
    associatedtype ReturnType
    static func query(_ query : Path) -> ReturnType
}
