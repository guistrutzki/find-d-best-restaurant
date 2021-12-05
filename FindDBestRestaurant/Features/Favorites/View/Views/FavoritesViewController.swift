//
//  FavoritesViewController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 09/09/21.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    // MARK: - Variable

    let controller = FavoritesController()
	
	private lazy var controllerResturant: RestaurantListController = {
		let controller = RestaurantListController.shared
		return controller
	}()
    
    lazy var favoritesView: FavoritesScreen = {
        return FavoritesScreen(self)
    }()

    // MARK: - Life cycle
    
    override func loadView() {
        view = favoritesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
		 //        controller.getFavoritesList()
		 controllerResturant.loadFavorites()
		 updateUI()
    }
    
    // MARK: - Private Functions
}

// MARK: - FavoritesScreenDelegate extension

extension FavoritesViewController: FavoritesScreenDelegate {
	
	func setFavorite(_ restaurant: RestaurantListResponse, isFavorite: Bool) {
		if isFavorite {
			controllerResturant.addRestaurantToFavorite(restaurant)
		} else {
			controllerResturant.removeRestaurantToFavorite(restaurant)
		}
		
		updateUI()
	}
	    
    func isEmpty() -> Bool {
        return controller.isEmpty()
    }
    
    func getFavorites(index: Int) -> RestaurantListResponse? {
		 //        return controller.getFavorite(index: index)
		 controllerResturant.getFavorite(index: index)
    }

    func setListCount() -> Int {
		 //       return controller.count
		 controllerResturant.numberOFavoriteRestaurants()
    }

    func fetchCharacterNextPage() { }
    
    func selectCharacter(at index: Int) {
		 
		 guard let restaurant = controllerResturant.getFavorite(index: index)
		 else { return }
		 
		 let viewController = RestaurantDetailViewController()
		 viewController.restaurantDetail = restaurant
		 viewController.isFavoriteRestaurant = true
		 viewController.delegate = self
		 viewController.modalTransitionStyle = .flipHorizontal
		 viewController.modalPresentationStyle = .fullScreen
		 present(viewController, animated: true, completion: nil)
	 }
    
    func setFavorite(at index: Int, isFavorite: Bool) { }
	
}

// MARK: - FavoritesControllerDelegate extension

extension FavoritesViewController: FavoritesControllerDelegate {
    
    func showError(_ error: String) {
        showMessage(title: K.error, message: error)
    }
    
    func updateUI() {
        favoritesView.updateData()
    }
}

extension FavoritesViewController: RestaurantDetailViewControllerDelegate {
	
	func addRestaurantToFavorite(_ restaurant: RestaurantListResponse) {
		controllerResturant.addRestaurantToFavorite(restaurant)
	}
	
	func removeRestaurantToFavorite(_ restaurant: RestaurantListResponse) {
		controllerResturant.removeRestaurantToFavorite(restaurant)
	}
	
}
