//
//  Vending.swift
//  hackchallenge
//
//  Created by Brandon Joseph on 11/19/19.
//  Copyright © 2019 Appdev. All rights reserved.
//

import Foundation

struct VendingResponse: Codable {
    var data: VendingDataResponse
}

struct VendingDataResponse: Codable {
    var vendings: [Vending]
}



struct Vending: Codable {
    var id: Int
    var Location: String
    var Floor: Int
    var Rating: Double
    var Product: [String]
    var Payment: [String]
}
