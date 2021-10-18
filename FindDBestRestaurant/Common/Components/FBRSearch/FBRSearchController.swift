//
//  FBRSearchController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 04/09/21.
//

import UIKit

class FBRSearchController: UISearchController {
    
    // MARK: - Public Properties
    
    weak var searchDelegate: FBRSearchControllerDelegate?
    
    // MARK: - Inits
    
    init() {
        super.init(searchResultsController: nil)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Public Properties
    
    func setupUI() {
        searchBar.delegate = self
        searchBar.tintColor = .label
        searchBar.placeholder = "Buscar"
        obscuresBackgroundDuringPresentation = false
    }
}

extension FBRSearchController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		 self.searchDelegate?.didFinishSearch(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchDelegate?.didCancelSearch()
    }
}

