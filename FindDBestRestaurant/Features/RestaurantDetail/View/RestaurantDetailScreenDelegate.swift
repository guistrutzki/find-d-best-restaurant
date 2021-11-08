//
//  RestaurantDetailScreenDelegate.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 04/09/21.
//

protocol RestaurantDetailScreenDelegate: AnyObject {
    func didTappedBackButton()
	 func didTappedHeartButton(restaurant: RestaurantListResponse, _ isFavorite: Bool)
}
