//
//  RestaurantDetailController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 01/09/21.
//

import Foundation

protocol RestaurantDetailControllerDelegate: AnyObject {
    
    func didSaveFavoriteWithSuccess()
    
    func didSaveFavoriteFailed()
}

class RestaurantDetailController {
    
    private weak var delegate: RestaurantDetailControllerDelegate?
    
    //MARK: - Public Functions
    
    func addRestaurantToFavorites(restaurant: RestaurantList) {
        let favorite = RestaurantList(
            name: restaurant.name, description: "", coverImage: restaurant.coverImage)
        
        PersistenceManager.updateWith(favorite: favorite, actionType: .add) { [weak self] error in
            guard let self = self else { return }
            
            guard let error = error else {
                self.delegate?.didSaveFavoriteWithSuccess()
                return
            }
            
            self.delegate?.didSaveFavoriteFailed()
        }
    }
    
}
