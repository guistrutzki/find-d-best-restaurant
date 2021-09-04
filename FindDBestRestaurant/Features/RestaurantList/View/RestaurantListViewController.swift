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
        let screen = RestaurantListScreen(self)
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationStyle()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    // MARK: - Private Functions
    
    private func setNavigationStyle() {
        setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func proceedToDetails(restaurant: Restaurant) {
        let viewController = RestaurantDetailViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension RestaurantListViewController: RestaurantListScreenDelegate {
    
    func proceedToDetailScreen(restaurant: Restaurant) {
        proceedToDetails(restaurant: restaurant)
    }
    
    func loadData() {
        
    }
}
