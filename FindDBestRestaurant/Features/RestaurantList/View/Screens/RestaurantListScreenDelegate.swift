//
//  RestaurantListScreenDelegate.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 29/08/21.
//

import Foundation

protocol RestaurantListScreenDelegate: AnyObject {
    
    func setListCount() -> Int 
    
    func proceedToDetailScreen(restaurant: RestaurantListResponse)
    
    func getRestaurants(index: IndexPath) -> RestaurantListResponse?
}
