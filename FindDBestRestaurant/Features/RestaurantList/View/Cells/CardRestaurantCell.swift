//
//  CardRestaurantCell.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 29/08/21.
//

import UIKit

class CardRestaurantCell: UITableViewCell {
	
	// MARK: - Variable
    
	static let identifier: String = String(describing: CardRestaurantCell.self)
	
	// MARK: - UI Element
    
	private var mainView: UIView = {
		let view = UIView(frame: .zero)
		view.layer.cornerRadius = 12
		view.clipsToBounds = true
		view.backgroundColor = .systemPink
		return view
	}()
	
	private var restaurantImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.contentMode = .scaleAspectFill
		return imageView
	}()
	
	private var nameLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.textAlignment = .left
		label.font = UIFont.boldSystemFont(ofSize: 32)
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
    
    func configureCell(restaurant: Restaurant) {
        nameLabel.text = restaurant.name
        restaurantImageView.load(url: restaurant.coverImage)
    }
}

// MARK: - Extension Code View

extension CardRestaurantCell: CodeView {
	
	func buildViewHierarchy() {
		addSubview(mainView)
		mainView.addSubview(restaurantImageView)
		mainView.addSubview(nameLabel)
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
		
		nameLabel.snp.makeConstraints { make in
			make.left.equalTo(mainView.snp.left).offset(15)
			make.right.equalTo(mainView.snp.right).inset(15)
			make.bottom.equalTo(mainView.snp.bottom).inset(15)
		}
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = Colors.gray800
	}
}
