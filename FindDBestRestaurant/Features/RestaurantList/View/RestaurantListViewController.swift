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
      //  setupSearchBar()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationStyle()
       // setupNavigation()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    // MARK: - Private Functions
    
    private func setupNavigation() {
        navigationItem.title = "Restaurantes"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setupSearchBar() {
        let search = FBRSearchController()
        search.searchDelegate = self
        
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
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

extension RestaurantListViewController: FBRSearchControllerDelegate {
    
    func didFinishSearch(_ searchText: String) {
        print("===FINISH")
    }
    
    func didCancelSearch() {
        print("==== CANCEL")
    }
}
