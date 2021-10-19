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
        tableView.backgroundColor = Colors.gray500
        return tableView
    }()

    // MARK: - Variable
    
    weak var delegate: RestaurantListScreenDelegate?
    
    // MARK: - Inits
    
    init(_ delegate: RestaurantListScreenDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Public Functions
    
    func updateView() {
		 DispatchQueue.main.async {
			 self.tableView.reloadData()
		 }
    }
    
    // MARK: - Private Functions
    
    private func getCardRestaurantCell(index: IndexPath) -> UITableViewCell {
        let identifier = CardRestaurantCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for:index) as? CardRestaurantCell
        else { return UITableViewCell()}

        if let restaurant = delegate?.getRestaurants(index: index) {
            cell.configureCell(restaurant: restaurant)
            cell.selectionStyle = .none
        }
       
        return cell
    }
}

// MARK: - UITableView Extension

extension RestaurantListScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.setListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getCardRestaurantCell(index: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let restaurant = delegate?.getRestaurants(index: indexPath) {
            self.delegate?.proceedToDetailScreen(restaurant: restaurant)
        }
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
