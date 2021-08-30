//
//  RestaurantsViewController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 21/08/21.
//

import UIKit

class RestaurantListViewController: UIViewController {
    
    // MARK: - Variable
    
    lazy var restaurantListScreen: RestaurantListScreen = {
        let screen = RestaurantListScreen()
        return screen
    }()
    
    let controller = RestaurantListController()
    
    // MARK: - Life cycle
    
    override func loadView() {
        view = restaurantListScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        controller.fetchRestaurantList()
    }
    
}
