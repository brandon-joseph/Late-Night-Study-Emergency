//
//  Bathroom.swift
//  hackchallenge
//
//  Created by Brandon Joseph on 11/19/19.
//  Copyright © 2019 Appdev. All rights reserved.
//

import Foundation

struct BathroomResponse: Codable {
    var data: BathroomDataResponse
}

struct BathroomDataResponse: Codable {
    var bathrooms: [Bathroom]
}




struct Bathroom: Codable {
    var building: Building
    var location: String
    var floor: String
    var rating: Double
    var reviews: [Review]
    
}
