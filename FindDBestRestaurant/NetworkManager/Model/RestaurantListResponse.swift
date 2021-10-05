//
//  RestaurantListResponse.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 29/08/21.
//

import Foundation

struct RestaurantListResponse: Codable, Equatable {
    
    let id: String
    
    let name: String
    
    let description: String
    
    let lat: String
    
    let lng: String
    
    let coverImage: String
    
    let logoImage: String
    
    let address: String
    
    let rating: Int
    
    let gallery: [String]
    
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, lat, lng, coverImage, logoImage, address, rating, gallery
        case createdAt = "created_at"
    }
}
