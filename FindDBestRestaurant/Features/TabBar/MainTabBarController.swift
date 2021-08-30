//
//  MainTabBarController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 21/08/21.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarStyle()
        setNavigationTitleStyle()
        
        viewControllers = [
            createNavigationController(for: RestaurantListViewController(), title: K.restaurants, image: SFSymbols.home ?? UIImage()),
            createNavigationController(for: SignUpVC(), title: "", image: SFSymbols.home ?? UIImage()),
            createNavigationController(for: FavoritesViewController(), title: K.favorites, image: SFSymbols.favorite ?? UIImage()),
            createNavigationController(for: TopRestaurantsViewController(), title: K.top, image: SFSymbols.location ?? UIImage())
        ]
    }
    
    //MARK: - Private Functions
    
    private func createNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
    
    private func setNavigationTitleStyle() {
        UINavigationBar.appearance().prefersLargeTitles = true
    }
    
    private func setTabBarStyle() {
        tabBar.tintColor = .systemRed
    }
}
