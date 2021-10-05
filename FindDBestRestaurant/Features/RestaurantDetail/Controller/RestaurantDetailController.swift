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
    
    var count: Int {
        return restaurant?.gallery.count ?? 0
    }
    
    
    //MARK: - Public Functions
    
    func getRestaurantDetails() -> RestaurantListResponse? {
        guard let details = restaurant  else { return nil }
        return details
    }
    
    func getGalleryNumberOfItems() -> Int {
        return restaurant?.gallery.count ?? 0
    }
    
    func getGalleryItems(indexPath: IndexPath) -> String? {
        return restaurant?.gallery[indexPath.row]
    }
    
    ///Usar em caso do count não funcionar
    func getGalleryItemsCount() -> Int? {
        let gallery = restaurant?.gallery ?? []
        var totalItems = 0
        for imageUrl in gallery {
            print(imageUrl)
            totalItems += 1
        }
        
        return totalItems
    }
    
    func addRestaurantToFavorites(restaurant: RestaurantListResponse) {
        PersistenceManager.updateWith(favorite: restaurant, actionType: .add) { [weak self] error in
            guard let self = self else { return }
            
            guard let error = error else {
                self.delegate?.didSaveFavoriteWithSuccess()
                return
            }
            
            self.delegate?.didSaveFavoriteFailed()
        }
    }
}
