//
//  TopRestaurantsCollectionCell.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 06/09/21.
//

import UIKit

final class TopRestaurantsCollectionCell: UICollectionViewCell {
	
	// MARK: - Variable
	static let identifier: String = String(describing: TopRestaurantsCollectionCell.self)
	
	// MARK: - UI Elements
	private var cardView: UIView = {
		let view = UIView(frame: .zero)
		view.backgroundColor = Colors.gray800
		view.layer.cornerRadius = 12
		view.clipsToBounds = true
		return view
	}()
	
	private var restaurantImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.backgroundColor = .systemBlue
		return imageView
	}()
	
	private var mainStackView: UIStackView = {
		let stackView = UIStackView(frame: .zero)
		stackView.axis = .vertical
		stackView.alignment = .leading
		stackView.spacing = 2
		stackView.distribution = .fill
		return stackView
	}()
	
	private var restaurantLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.text = "Restaurante"
		label.textAlignment = .center
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
		label.numberOfLines = 1
		return label
	}()
	
	private var titleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.textAlignment = .left
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
		label.numberOfLines = 1
		label.minimumScaleFactor = 15
		return label
	}()
	
	private var starStackView: UIStackView = {
		let stackView = UIStackView(frame: .zero)
		stackView.axis = .horizontal
		stackView.alignment = .center
		stackView.spacing = 5
		stackView.distribution = .fillEqually
		return stackView
	}()
	
	private lazy var star1ImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.image = UIImage(systemName: "star")
		imageView.tintColor = .yellow
		return imageView
	}()
	
	private lazy var star2ImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.image = UIImage(systemName: "star")
		imageView.tintColor = .yellow
		return imageView
	}()
	
	private lazy var star3ImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.image = UIImage(systemName: "star")
		imageView.tintColor = .yellow
		return imageView
	}()
	
	private lazy var star4ImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.image = UIImage(systemName: "star")
		imageView.tintColor = .yellow
		return imageView
	}()
	
	private lazy var star5ImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.image = UIImage(systemName: "star")
		imageView.tintColor = .yellow
		return imageView
	}()
	
	private lazy var arrayStars: [UIImageView] = [
		star1ImageView, star2ImageView,
		star3ImageView, star4ImageView,
		star5ImageView
	]
	
	// MARK: - Initialize
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Function
	func setupCell(restaurant: RestaurantListResponse) {
		titleLabel.text = restaurant.name
		
		for index in 0..<restaurant.rating {
			arrayStars[index].image = UIImage(systemName: "star.fill")
		}
		
	}
	
}

// MARK: - Extension CodeView
extension TopRestaurantsCollectionCell: CodeView {
	
	func buildViewHierarchy() {
		contentView.addSubview(cardView)
		cardView.addSubview(restaurantImageView)
		cardView.addSubview(mainStackView)
		mainStackView.addArrangedSubview(restaurantLabel)
		mainStackView.addArrangedSubview(titleLabel)
		cardView.addSubview(starStackView)
		starStackView.addArrangedSubview(star1ImageView)
		starStackView.addArrangedSubview(star2ImageView)
		starStackView.addArrangedSubview(star3ImageView)
		starStackView.addArrangedSubview(star4ImageView)
		starStackView.addArrangedSubview(star5ImageView)
	}
	
	func setupConstraints() {
		cardView.snp.makeConstraints({ make in
			make.top.left.right.bottom.equalTo(contentView)
		})
		
		restaurantImageView.snp.makeConstraints { make in
			make.top.left.bottom.equalTo(cardView)
			make.width.equalTo(cardView.snp.width).multipliedBy(0.4)
		}
		
		mainStackView.snp.makeConstraints { make in
			make.top.equalTo(cardView.snp.top).offset(12)
			make.left.equalTo(restaurantImageView.snp.right).offset(14)
			make.right.equalTo(cardView.snp.right).inset(10)
		}
		
		restaurantLabel.snp.makeConstraints { make in
			make.height.equalTo(12)
		}
		
		titleLabel.snp.makeConstraints { make in
			make.height.equalTo(18)
		}
		
		starStackView.snp.makeConstraints { make in
			make.left.equalTo(mainStackView.snp.left)
			make.bottom.equalTo(cardView.snp.bottom).inset(14)
		}
		
		star1ImageView.snp.makeConstraints { make in
			make.height.width.equalTo(20)
		}
		
		star2ImageView.snp.makeConstraints { make in
			make.height.width.equalTo(20)
		}
		
		star3ImageView.snp.makeConstraints { make in
			make.height.width.equalTo(20)
		}
		
		star4ImageView.snp.makeConstraints { make in
			make.height.width.equalTo(20)
		}
		
		star5ImageView.snp.makeConstraints { make in
			make.height.width.equalTo(20)
		}
				
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .clear
	}
	
}
