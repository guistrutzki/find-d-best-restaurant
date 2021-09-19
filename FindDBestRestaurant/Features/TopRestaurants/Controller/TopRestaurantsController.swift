//
//  TopRestaurantsController.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 08/09/21.
//

import Foundation

protocol TopRestaurantsControllerDelegate: AnyObject {
	func successLoad(_ list: [RestaurantListResponse])
	func errorLoad()
}

class TopRestaurantsController {
	
	// MARK: - Variable
	private var restaurants: [RestaurantListResponse] = []
	weak var delegate: TopRestaurantsControllerDelegate?
	
	var count: Int {
		return restaurants.count
	}
	
	// MARK: - Functions
	func loadRestaurantList() {
		let baseUrl = "https://restaurant-api.guistrutzki.dev/restaurants"
		
		guard let url = URL(string: baseUrl) else {
			print("url error")
			return
		}
		
		NetworkManager.request(url: url) { [weak self] result in
			switch result {
				case .success(let restaurantResponse):
					self?.didFetchSuccess(restaurantResponse)
				case .failure(let error):
					self?.didFetchFailed(error: error)
			}
		}
	}
	
	func getRestaurants(indexPath: IndexPath) -> RestaurantListResponse {
		return restaurants[indexPath.row]
	}
	
	private func didFetchSuccess(_ response: [RestaurantListResponse]) {
		var latitude = ""
		
		response.forEach { restaurant in
			
			// Retirar
			if latitude != restaurant.lat {
				self.restaurants.append(restaurant)
			}
			
			latitude = restaurant.lat
			
		}
		self.delegate?.successLoad(self.restaurants)
	}
	
	private func didFetchFailed(error: Error) {
		print("deu erro")
		self.delegate?.errorLoad()
	}
	
}
