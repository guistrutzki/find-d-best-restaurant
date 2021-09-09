//
//  FavoritesDelegate.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 09/09/21.
//

import Foundation

protocol FavoritesScreenDelegate: AnyObject {

    func fetchCharacterNextPage()
    
    func selectCharacter(at index: Int)
    
    func setFavorite(at index: Int, value: Bool)
}
