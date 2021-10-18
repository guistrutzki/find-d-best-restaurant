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
    
    private var restaurants: [RestaurantListResponse] = []
	 private var filterdRestaurants: [RestaurantListResponse] = []
    
    var count: Int {
		 if filterdRestaurants.isEmpty {
			 return restaurants.count
		 }
        return filterdRestaurants.count
    }
    
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
    
    // MARK: - Private Functions
    
    private func didFetchSuccess(_ response: [RestaurantListResponse]) {
        restaurants.append(contentsOf: response)
        delegate?.updateView(restaurantList: restaurants)
    }
    
    private func didFetchFailed(error: Error) {
        print("deu erro")
    }
}
