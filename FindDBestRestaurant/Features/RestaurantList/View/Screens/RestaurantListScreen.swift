//
//  RestaurantListScreen.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 29/08/21.
//

import UIKit

class RestaurantListScreen: UIView {
    
    // MARK: - UI Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 36, weight: .heavy)
        label.numberOfLines = 0
        label.textColor = .white
        label.text = K.restaurants
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Colors.gray800
        return tableView
    }()
    
    var restaurantList:[Restaurant] = [
        Restaurant(name: "Figueira Rubayat", description: "", coverImage: Images.rubayat ?? UIImage()),
        Restaurant(name: "Top Paulista", description: "", coverImage: Images.restaurant1 ?? UIImage()),
        Restaurant(name: "Paris Bistrô", description: "", coverImage: Images.restaurant3 ?? UIImage()),
        Restaurant(name: "Figueira", description: "", coverImage: Images.rubayat ?? UIImage()),
        Restaurant(name: "Top Garden Sp", description: "", coverImage: Images.restaurant1 ?? UIImage())
    ]
    
    var restaurants:[RestaurantListResponse] = []
    
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
    
    func setup(_ restaurantList: [RestaurantListResponse] ) {
        self.restaurants.append(contentsOf: restaurantList)
        tableView.reloadData()
    }
    
    // MARK: - Private Functions
    
    private func getCardRestaurantCell(index: IndexPath) -> UITableViewCell {
        let identifier = CardRestaurantCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for:index) as? CardRestaurantCell
        else { return UITableViewCell()}
        
        let restaurant = restaurantList[index.row]
        //        cell.configureCell(restaurant:restaurant)
        cell.setup(restaurant: restaurant)
        cell.selectionStyle = .none
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurant = restaurantList[indexPath.row]
        delegate?.proceedToDetailScreen(restaurant: restaurant)
    }
}

// MARK: - CodeView Extension

extension RestaurantListScreen: CodeView {
    
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.right.left.equalTo(safeAreaLayoutGuide).offset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.right.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = Colors.gray500
        tableView.delegate = self
        tableView.dataSource = self
        CardRestaurantCell.registerOn(tableView)
    }
}
