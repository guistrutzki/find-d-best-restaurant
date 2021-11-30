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
    private let restaurantService = RestaurantService()
	
	// MARK: - Variable
	private var restaurants: [RestaurantListResponse] = []
	weak var delegate: TopRestaurantsControllerDelegate?
	
	var count: Int {
		return restaurants.count
	}
    
    func loadRestaurantList() {
        self.restaurantService.fetchRestaurants {[weak self] (result: Result <[RestaurantListResponse]?, NetworkError>) in
            guard let self = self else { return }
            switch result {
            case .success(let restaurants):
                self.didFetchSuccess(restaurants ?? [])
                break
            case .failure(let error):
                self.didFetchFailed(error: error)
                break
            }
        }
    }
	
	func getRestaurants(indexPath: IndexPath) -> RestaurantListResponse {
		return restaurants[indexPath.row]
	}
	
	private func didFetchSuccess(_ response: [RestaurantListResponse]) {
		self.restaurants.append(contentsOf: response)
		self.delegate?.successLoad(self.restaurants)
	}
	
	private func didFetchFailed(error: Error) {
		print("deu erro")
		self.delegate?.errorLoad()
	}
}

extension TopRestaurantsController: RestaurantServiceProtocol {
    func fetchRestaurants(_ completion: @escaping (Result<[RestaurantListResponse]?, NetworkError>) -> Void) {}
}
