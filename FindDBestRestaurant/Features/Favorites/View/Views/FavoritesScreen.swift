//
//  FavoritesView.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 09/09/21.
//

import UIKit
import SnapKit

class FavoritesScreen : UIView {
    
    // MARK: - UI Components
    
    // MARK: - Variable
    
    weak var delegate: FavoritesScreenDelegate?
    
    // MARK: - Inits
    
    init(_ delegate: FavoritesScreenDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Public Functions
    
    
    // MARK: - Private Functions
}

// MARK: - CodeView Extension

extension FavoritesScreen : CodeView {
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
}

