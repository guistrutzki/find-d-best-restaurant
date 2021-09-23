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
            createNavigationController(for: RestaurantListViewController(), title: K.home, image: SFSymbols.home ?? UIImage()),
            createNavigationController(for: TopRestaurantsViewController(), title: K.top, image: SFSymbols.location ?? UIImage()),
            createNavigationController(for: FavoritesViewController(), title: K.favorites, image: SFSymbols.favorite ?? UIImage()),
            createNavigationController(for: SettingsVC(), title: K.settings, image: SFSymbols.person ?? UIImage())
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
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }
    
    private func setTabBarStyle() {
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = Colors.gray800
    }
}
