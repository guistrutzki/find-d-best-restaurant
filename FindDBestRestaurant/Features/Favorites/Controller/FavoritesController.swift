//
//  FavoritesController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 09/09/21.
//

import UIKit

protocol FavoritesControllerDelegate: AnyObject {
    
    func updateUI()
    
    func showError(_ error: String)
}

class FavoritesController {

    // MARK: - Variable
    
    var favorites:[Restaurant] = [
        Restaurant(name: "Figueira Rubayat", description: "", coverImage: Images.rubayat ?? UIImage()),
        Restaurant(name: "Top Paulista", description: "", coverImage: Images.restaurant1 ?? UIImage()),
        Restaurant(name: "Top Garden Sp", description: "", coverImage: Images.restaurant1 ?? UIImage())
    ]
    
    var favoritesList: [RestaurantListResponse] = []
    
    var count: Int {
        favoritesList.count
    }
    
    weak var delegate: FavoritesControllerDelegate?
    
    // MARK: - Public Functions
    
    func isEmpty() -> Bool {
        return favoritesList.isEmpty
    }
    
    func getFavorite(index: Int) -> RestaurantListResponse {
        return favoritesList[index]
    }
    
    func getFavoritesList() {
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let favorites):
                self.delegate?.updateUI()
                self.favoritesList = favorites
                print("sucesso")
            case .failure(let error):
                self.delegate?.showError(error.rawValue)
                print("falha")
            }
        }
    }
    
    // MARK: - Private Functions
}
