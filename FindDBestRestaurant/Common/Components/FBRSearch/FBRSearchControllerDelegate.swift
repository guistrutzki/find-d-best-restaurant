//
//  FBRSearchControllerDelegate.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 04/09/21.
//

import UIKit

protocol FBRSearchControllerDelegate: AnyObject {
    
    func didFinishSearch(_ searchText: String)
    
    func didCancelSearch()
}
