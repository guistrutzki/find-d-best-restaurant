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
            restaurantDetailScreen.configureView(restaurant: details)
        }
    }
}

// MARK: - RestaurantDetailScreenDelegate extension

extension RestaurantDetailViewController: RestaurantDetailScreenDelegate {

    func didTappedHeartButton(restaurant: RestaurantListResponse) {
        controller.addRestaurantToFavorites(restaurant: restaurant)
    }
    
    func didTappedBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension RestaurantDetailViewController: RestaurantDetailControllerDelegate {
    
    func didSaveFavoriteWithSuccess() {
        
    }
    
    func didSaveFavoriteFailed() {
        
    }
}
