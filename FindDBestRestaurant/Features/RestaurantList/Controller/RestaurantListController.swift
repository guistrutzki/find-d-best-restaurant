//
//  RestaurantListController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 29/08/21.
//

import Foundation

class RestaurantListController {
    
    // MARK: - Variable
    
    private var restaurants: [Restaurant] = []
    
    var count: Int {
        return restaurants.count
    }
    
    // MARK: - Public Functions
    
    func fetchRestaurantList() {
        let baseUrl = "https://restaurant-api.guistrutzki.dev/restaurants"
        
        NetworkManager.request(url: baseUrl) { [weak self] result in
            switch result {
            case .success(let restaurantResponse):
                print(restaurantResponse)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Private Functions
    
    private func didFetchSuccess(response: RestaurantListResponse) {
        let restaurantList = response
//        self.restaurants.append(contentsOf: restaurantList)
    }
}
