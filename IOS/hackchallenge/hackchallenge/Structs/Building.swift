//
//  Bathroom.swift
//  hackchallenge
//
//  Created by Brandon Joseph on 11/16/19.
//  Copyright © 2019 Appdev. All rights reserved.
//

import Foundation

struct BuildingResponse: Codable {
    var data: BuildingDataResponse
}

struct BuildingDataResponse: Codable {
    var buildings: [Building]
}



struct Building: Codable {
    var name: String
    var id: Int
    var lat: Double
    var long: Double
    var hours: String
    var bathrooms: [Bathroom]
    var vending: [Vending]
    
}
