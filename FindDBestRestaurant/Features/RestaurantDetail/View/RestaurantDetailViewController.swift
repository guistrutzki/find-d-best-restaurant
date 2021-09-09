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

    // MARK: - Life cycle

    override func loadView() {
        view = restaurantDetailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - RestaurantDetailScreenDelegate extension

extension RestaurantDetailViewController: RestaurantDetailScreenDelegate {
    
    func didTappedHeartButton() {
        print("====HEART BUTTON=====")
    }
    
    func didTappedBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
}
