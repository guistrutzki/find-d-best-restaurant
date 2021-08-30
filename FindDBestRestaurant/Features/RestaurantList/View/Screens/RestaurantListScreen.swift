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
        tableView.backgroundColor = Colors.gray800
        return tableView
    }()
    
    var restaurantList:[Restaurant] = [
        Restaurant(name: "Mac", description: "fast-food", coverImage: ""),
        Restaurant(name: "Pizzeria", description: "pizzeria", coverImage: ""),
        Restaurant(name: "Japa", description: "japa", coverImage: "")
    ]
    
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
        
        let restaurant = restaurantList[index.row]
        cell.configureCell(restaurant:restaurant)
        
        return cell
        
    }
}

// MARK: - UITableView Extension

extension RestaurantListScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getCardRestaurantCell(index: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

// MARK: - CodeView Extension

extension RestaurantListScreen: CodeView {
    
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = Colors.gray500
        tableView.delegate = self
        tableView.dataSource = self
        CardRestaurantCell.registerOn(tableView)
    }
}
