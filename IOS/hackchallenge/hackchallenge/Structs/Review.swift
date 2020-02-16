//
//  Review.swift
//  hackchallenge
//
//  Created by Brandon Joseph on 12/7/19.
//  Copyright © 2019 Appdev. All rights reserved.
//

import Foundation

struct ReviewResponse: Codable {
    var data: ReviewDataResponse
}

struct ReviewDataResponse: Codable {
    var reviews: [Review]
}



struct Review: Codable {
    var id: Int
    var bathroom_id: Int
    var user_id: Int
    var username: String
    var rating: Double
    var text: String
}
