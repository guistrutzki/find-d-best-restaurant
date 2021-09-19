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
    
    // MARK: - Private Functions
}

// MARK: - FavoritesScreenDelegate extension

extension FavoritesViewController: FavoritesScreenDelegate {
    
    func isEmpty() -> Bool {
        return controller.isEmpty()
    }
    
    func getFavorites(index: Int) -> Restaurant? {
        return controller.getFavorite(index: index)
    }

    func setListCount() -> Int {
       return controller.count
    }

    func fetchCharacterNextPage() {
        
    }
    
    func selectCharacter(at index: Int) {
        
    }
    
    func setFavorite(at index: Int, value: Bool) {
        
    }
}
