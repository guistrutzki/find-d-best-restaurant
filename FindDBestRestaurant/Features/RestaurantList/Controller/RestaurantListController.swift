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
    
    // MARK: - Private Functions
    
    private func didFetchSuccess(_ response: [RestaurantListResponse]) {
//        let restaurantList = response
//        self.restaurants.append(restaurantList)
    }
    
    private func didFetchFailed(error: Error) {
        print("deu erro")
    }
}
