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
    
    weak var delegate: RestaurantDetailControllerDelegate?
    
    var restaurant: RestaurantListResponse?
    
    
    //MARK: - Public Functions
    
    func getRestaurantDetails() -> RestaurantListResponse? {
        guard let details = restaurant  else { return nil }
        return details
    }
    
    func addRestaurantToFavorites(restaurant: RestaurantListResponse) {
        let favorite = restaurant
        
        PersistenceManager.updateWith(favorite: favorite, actionType: .add) { [weak self] error in
            guard let self = self else { return }
            
            guard let _ = error else {
                self.delegate?.didSaveFavoriteWithSuccess()
                return
            }
            
            self.delegate?.didSaveFavoriteFailed()
        }
    }
}
