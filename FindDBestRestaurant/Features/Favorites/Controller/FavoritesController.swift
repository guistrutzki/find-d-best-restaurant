//
//  FavoritesController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 09/09/21.
//

import UIKit

class FavoritesController {

    // MARK: - Variable
    
    var favorites:[Restaurant] = [
        Restaurant(name: "Figueira Rubayat", description: "", coverImage: Images.rubayat ?? UIImage()),
        Restaurant(name: "Top Paulista", description: "", coverImage: Images.restaurant1 ?? UIImage()),
        Restaurant(name: "Top Garden Sp", description: "", coverImage: Images.restaurant1 ?? UIImage())
    ]
    
    var count: Int {
        favorites.count
    }
    
    // MARK: - Public Functions
    
    func isEmpty() -> Bool {
        return favorites.isEmpty
    }
    
    func getFavorite(index: Int) -> Restaurant {
        return favorites[index]
    }
    
    // MARK: - Private Functions
}
