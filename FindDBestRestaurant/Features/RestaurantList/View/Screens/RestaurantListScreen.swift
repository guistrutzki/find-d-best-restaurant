//
//  RestaurantListScreen.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 29/08/21.
//

import UIKit

class RestaurantListScreen: UIView {
    
    // MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    // MARK: - Private Functions
    
    private func getCardRestaurantCell(index: IndexPath) -> UITableViewCell {
        let identifier = CardRestaurantCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for:index) as? CardRestaurantCell
        else { return UITableViewCell()}
        
        return cell
    }
}

// MARK: - UITableView Extension

extension RestaurantListScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getCardRestaurantCell(index: indexPath)
    }
}

// MARK: - CodeView Extension

extension RestaurantListScreen: CodeView {
    
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        tableView.delegate = self
        tableView.dataSource = self
        CardRestaurantCell.registerOn(tableView)
    }
}
