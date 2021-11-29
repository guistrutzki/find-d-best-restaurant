//
//  RestaurantListController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 29/08/21.
//

import Foundation

protocol RestaurantListControllerDelegate: AnyObject {
    
    func updateView(restaurantList: [RestaurantListResponse])
}

class RestaurantListController {
    
    // MARK: - Variable
    private let restaurantService = RestaurantService()
    private var restaurants: [RestaurantListResponse] = []
    private var filterdRestaurants: [RestaurantListResponse] = []
    
    var count: Int {
      if filterdRestaurants.isEmpty {
         return restaurants.count
      }
		return filterdRestaurants.count
    }
	
	 let favoriteRealmManager = FavoriteRealmManager()
    
    weak var delegate: RestaurantListControllerDelegate?
    
    // MARK: - Public Functions
    
    func loadRestaurants() {
        self.restaurantService.fetchRestaurants { response in
            if (response == nil) {
                self.didFetchFailed(error: NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Invalid access token"]))
            } else {
                self.didFetchSuccess(response ?? [])
            }
        }
    }
    
    func getRestaurants(indexPath: IndexPath) -> RestaurantListResponse? {
		 
		 if filterdRestaurants.isEmpty {
			 return restaurants[indexPath.row]
		 }
		 return filterdRestaurants[indexPath.row]
    }
	
	func filterRestaurant(_ searchText: String) {
		
		if searchText.isEmpty {
			filterdRestaurants.removeAll()
			return
		}
		filterdRestaurants = restaurants.filter { $0.name.lowercased().contains(searchText.lowercased()) }
	}
	
	func loadFavorites() {
		favoriteRealmManager.loadFavorites()
	}
	
	func isFavoriteRestaurant(_ restaurant: RestaurantListResponse) -> Bool {
		guard let result = favoriteRealmManager.getFavorite(restaurant)
		else { return false }
		
		if result.isEmpty {
			return false
		} else {
			return true
		}
	}
	
	func addRestaurantToFavorite(_ restaurant: RestaurantListResponse) {
		let favorite = FavoriteRealm()
		favorite.idRestaurant = restaurant.id
		favoriteRealmManager.add(newFavorite: favorite)
	}
	
	func removeRestaurantToFavorite(_ restaurant: RestaurantListResponse) {
		let favorite = FavoriteRealm()
		favorite.idRestaurant = restaurant.id
		favoriteRealmManager.delete(favorite)
	}
    
    // MARK: - Private Functions
    
    private func didFetchSuccess(_ response: [RestaurantListResponse]) {
        restaurants.append(contentsOf: response)
        delegate?.updateView(restaurantList: restaurants)
    }
    
    private func didFetchFailed(error: Error) {
        print("deu erro")
    }
}

extension RestaurantListController: RestaurantServiceProtocol {
    func fetchRestaurants(_ completion: @escaping ([RestaurantListResponse]?) -> Void) {}
}
