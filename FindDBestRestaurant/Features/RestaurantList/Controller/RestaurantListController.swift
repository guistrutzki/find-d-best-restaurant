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
    
    var count: Int {
        return restaurants.count 
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
        return restaurants[indexPath.row]
    }
    
//    func getRestaurants1(indexPath: Int) -> RestaurantListResponse {
//        return restaurants[indexPath]
//    }
    
    // MARK: - Private Functions
    
    private func didFetchSuccess(_ response: [RestaurantListResponse]) {
        restaurants.append(contentsOf: response)
        delegate?.updateView(restaurantList: restaurants)
    }
    
    private func didFetchFailed(error: Error) {
        print("deu erro")
    }
}
