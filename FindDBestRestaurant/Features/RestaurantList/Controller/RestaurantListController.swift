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
	
	// MARK: - Singleton
	
	static let shared = RestaurantListController()
    
    // MARK: - Variable
    
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
    
    func fetchRestaurantList() {
        let baseUrl = "https://restaurant-api.guistrutzki.dev/restaurants"
        
        guard let url = URL(string: baseUrl) else {
            print("url error")
            return
        }
        
        NetworkManager.request(url: url) { [weak self] result in
            switch result {
            case .success(let restaurantResponse):
                print(restaurantResponse)
                self?.didFetchSuccess(restaurantResponse)
            case .failure(let error):
                print(error)
                self?.didFetchFailed(error: error)
            }
        }
    }
	
	func loadRestaurantList(token: String?) {
		guard let token = token else { return }
		
		let urlString = "\(API_BASE_URL)/restaurants"
		guard let url = URL(string: urlString) else { return }
		
		APIManager.loadRestaurantList(url: url, token: token) { success, error in
			if let result = success {
				print(result)
				self.didFetchSuccess(result)
			} else {
				if let error = error {
					self.didFetchFailed(error: error)
				}
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
		filterdRestaurants = restaurants.filter { $0.name.lowercased().contains(searchText.lowercased())
		}
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
	
	func numberOFavoriteRestaurants() -> Int {
		favoriteRealmManager.countFavorites()
	}
	
	func getFavorite(index: Int) -> RestaurantListResponse? {
		guard let favorite = favoriteRealmManager.getFavorite(index: index)
		else { return nil }
		
		let restaurant = restaurants.filter {
			$0.id.lowercased().contains(favorite.idRestaurant.lowercased())
		}
		
		return restaurant.first
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
