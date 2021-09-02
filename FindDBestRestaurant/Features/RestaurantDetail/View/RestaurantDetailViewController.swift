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
        let screen = RestaurantDetailScreen()
        return screen
    }()

    // MARK: - Life cycle

    override func loadView() {
        view = restaurantDetailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
