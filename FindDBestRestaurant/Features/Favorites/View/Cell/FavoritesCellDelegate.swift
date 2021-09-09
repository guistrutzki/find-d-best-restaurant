//
//  FavoritesCellDelegate.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 09/09/21.
//

import UIKit

protocol FavoritesCellDelegate: AnyObject {
    
    func setFavorite(_ cell: UICollectionViewCell, value: Bool)
}
