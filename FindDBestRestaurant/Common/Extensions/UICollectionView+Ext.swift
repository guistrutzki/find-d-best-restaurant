//
//  UICollectionView+Ext.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 02/09/21.
//

import UIKit

extension UICollectionViewCell {
    
    static func registerOn(_ collectionView: UICollectionView) {
        let reuseIdentifier = String(describing: self.self)
        collectionView.register(self.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
