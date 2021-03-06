//
//  CardRestaurantCell.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 29/08/21.
//

import UIKit

class CardRestaurantCell: UITableViewCell {
	
	// MARK: - Identifier
    
	static let identifier: String = String(describing: CardRestaurantCell.self)
	
	// MARK: - UI Element
    
	private var mainView: UIView = {
		let view = UIView(frame: .zero)
		view.layer.cornerRadius = 12
		view.clipsToBounds = true
		return view
	}()
	
	private var restaurantImageView: UIImageView = {
		let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
		return imageView
	}()
	
	private var restaurantBackgroundView: UIView = {
		let view = UIView(frame: .zero)
		view.backgroundColor = .black
		view.alpha = 0.5
		return view
	}()
	
	private var nameLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .left
		label.font = UIFont.boldSystemFont(ofSize: 36)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	// MARK: - Initialize
    
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Public Function
    
    func configureCell(restaurant: RestaurantListResponse) {
        nameLabel.text = restaurant.name
        restaurantImageView.load(url: restaurant.coverImage)
    }
}

// MARK: - Extension Code View

extension CardRestaurantCell: CodeView {
	
	func buildViewHierarchy() {
		mainView.addSubview(restaurantImageView)
		mainView.addSubview(restaurantBackgroundView)
		mainView.addSubview(nameLabel)
		addSubview(mainView)
	}
	
	func setupConstraints() {
		mainView.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.left.equalToSuperview().offset(15)
			make.right.equalToSuperview().inset(15)
			make.bottom.equalToSuperview().inset(15)
		}
		
		restaurantImageView.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.left.equalToSuperview()
			make.right.equalToSuperview()
			make.bottom.equalToSuperview()
		}
		
		restaurantBackgroundView.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.left.equalToSuperview()
			make.right.equalToSuperview()
			make.bottom.equalToSuperview()
		}
		
		nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(15)
		}
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = Colors.gray500
	}
}
