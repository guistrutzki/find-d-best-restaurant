//
//  RestaurantDetailViewController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 01/09/21.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    // MARK: - Variable
    
    lazy var restaurantDetailScreen: RestaurantDetailScreen = {
        let screen = RestaurantDetailScreen(self)
        return screen
    }()
    
    private lazy var controller: RestaurantDetailController = {
        let controller = RestaurantDetailController()
        controller.delegate = self
        return controller
    }()
    
    var restaurantDetail : RestaurantListResponse?
	 var isFavoriteRestaurant: Bool = false
	
	 weak var delegate: RestaurantDetailViewControllerDelegate?
    
    // MARK: - Life cycle

    override func loadView() {
        view = restaurantDetailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRestaurantDetails()
    }
    
    private func getRestaurantDetails() {
        if let details = restaurantDetail {
			   restaurantDetailScreen.configureView(restaurant: details, isFavorite: isFavoriteRestaurant)
        }
    }
}

// MARK: - RestaurantDetailScreenDelegate extension

extension RestaurantDetailViewController: RestaurantDetailScreenDelegate {
	
    func didTappedHeartButton(restaurant: RestaurantListResponse) {
        controller.addRestaurantToFavorites(restaurant: restaurant)
    }
    
    func didTappedBackButton() {
		 dismiss(animated: true)
    }
	
	func didTappedHeartButton(restaurant: RestaurantListResponse, _ isFavorite: Bool) {
		if isFavorite {
			delegate?.addRestaurantToFavorite(restaurant)
		} else {
			delegate?.removeRestaurantToFavorite(restaurant)
		}
	}
	
}

extension RestaurantDetailViewController: RestaurantDetailControllerDelegate {
    
    func didSaveFavoriteWithSuccess() {
        
    }
    
    func didSaveFavoriteFailed() {
        
    }
}
