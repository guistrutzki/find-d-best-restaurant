//
//  RestaurantDetailViewControllerDelegate.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 02/11/21.
//

protocol RestaurantDetailViewControllerDelegate: AnyObject {
	func addRestaurantToFavorite(_ restaurant: RestaurantListResponse)
	func removeRestaurantToFavorite(_ restaurant: RestaurantListResponse)
}
