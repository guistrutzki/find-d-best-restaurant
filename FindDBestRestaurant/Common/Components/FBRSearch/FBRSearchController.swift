//
//  FBRSearchController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 04/09/21.
//

import UIKit

class FBRSearchController: UISearchController {

    
    // MARK: - Private Properties
    
    private var searchTask: DispatchWorkItem?
    
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
        guard !searchText.isEmpty else { return }
        
        searchTask?.cancel()
        
        let newSearchTask = DispatchWorkItem { [weak self] in
            DispatchQueue.main.async {
                self?.searchDelegate?
                    .didFinishSearch(searchText)
            }
        }
        
        searchTask = newSearchTask
        
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + 0.5,
            execute: newSearchTask)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchDelegate?.didCancelSearch()
    }
}

