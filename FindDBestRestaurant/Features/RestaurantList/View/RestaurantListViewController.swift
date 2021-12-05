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
    
    private lazy var controller: RestaurantListController = {
		 let controller = RestaurantListController.shared
        controller.delegate = self
        return controller
    }()
    
    // MARK: - Life cycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = restaurantListScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.loadRestaurants()
        controller.loadFavorites()
        setupSearchBar()  
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
		  setupNavigation()
    }
    
    // MARK: - Private Functions
    
    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setupSearchBar() {
        let search = FBRSearchController()
        search.searchDelegate = self

        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func proceedToDetails(restaurant: RestaurantListResponse) {
        let viewController = RestaurantDetailViewController()
        viewController.restaurantDetail = restaurant
		  viewController.isFavoriteRestaurant = controller.isFavoriteRestaurant(restaurant)
		  viewController.delegate = self
		  viewController.modalTransitionStyle = .flipHorizontal
		  viewController.modalPresentationStyle = .fullScreen
		  present(viewController, animated: true, completion: nil)
    }
}

extension RestaurantListViewController: RestaurantListScreenDelegate {

    func getRestaurants(index: IndexPath) -> RestaurantListResponse? {
        controller.getRestaurants(indexPath: index)
    }
    
    func setListCount() -> Int {
       return controller.count
    }
    
    func proceedToDetailScreen(restaurant: RestaurantListResponse) {
        proceedToDetails(restaurant: restaurant)
    }
}

extension RestaurantListViewController: RestaurantListControllerDelegate {
    func updateView(restaurantList: [RestaurantListResponse]) {
        restaurantListScreen.updateView()
    }
}

extension RestaurantListViewController: FBRSearchControllerDelegate {
    
    func didFinishSearch(_ searchText: String) {
		 controller.filterRestaurant(searchText)
		 restaurantListScreen.updateView()
    }
    
    func didCancelSearch() {
		 controller.filterRestaurant("")
		 restaurantListScreen.updateView()
    }
}

extension RestaurantListViewController: RestaurantDetailViewControllerDelegate {
	
	func addRestaurantToFavorite(_ restaurant: RestaurantListResponse) {
		controller.addRestaurantToFavorite(restaurant)
	}
	
	func removeRestaurantToFavorite(_ restaurant: RestaurantListResponse) {
		controller.removeRestaurantToFavorite(restaurant)
	}
	
}
