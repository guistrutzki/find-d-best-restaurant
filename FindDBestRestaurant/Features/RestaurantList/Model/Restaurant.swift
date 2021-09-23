//
//  Restaurant.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 29/08/21.
//

import UIKit

struct Restaurant{
    
    let name: String
    
    let description: String
    
    let coverImage: UIImage
}

struct RestaurantList: Codable , Equatable {
    
    let name: String
    
    let description: String
    
    let coverImage: String
}
