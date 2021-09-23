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
    
    func getRestaurants(indexPath: IndexPath) -> RestaurantListResponse? {
        return restaurants[indexPath.row]
    }
    
    // MARK: - Private Functions
    
    private func didFetchSuccess(_ response: [RestaurantListResponse]) {
        restaurants.append(contentsOf: response)
        print("COUNT: =====\(restaurants.count)")
        print("RESTAURANTS: \(restaurants)")
        delegate?.updateView(restaurantList: restaurants)
        
//                for item in response {
//                    print(item.name)
//                    print("===== RESPONSE \(response)")
//                    self.restaurants.append(contentsOf: response)
//                    delegate?.updateView(restaurantList: restaurants)
//                    print("RESTAURANTS: \(restaurants)")
//                }
        
    }
    
    private func didFetchFailed(error: Error) {
        print("deu erro")
    }
}
