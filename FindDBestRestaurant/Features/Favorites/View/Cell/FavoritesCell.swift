//
//  FavoritesCell.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 09/09/21.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = String(describing: FavoritesCell.self)
    
    // MARK: - UI Elements
    
    private lazy var contentCard: FBRCardView = {
        let cardView = FBRCardView(frame: .zero)
        cardView.shadowOpacity = 0.6
        return cardView
    }()
    
    private lazy var favoriteCard: FBRCardView = {
        let cardView = FBRCardView(frame: .zero)
        cardView.clipsToBounds = true
        cardView.backgroundColor = Colors.darkness
        return cardView
    }()
    
    private lazy var favoriteName: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var favoriteImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var loveItButton: FBRLoveItButton = {
        return FBRLoveItButton(frame: .zero)
    }()
    
    weak var delegate: FavoritesCellDelegate?
	
	private var restaurant: RestaurantListResponse?
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Public Functions
    
    func setup(_ restaurant: RestaurantListResponse) {
		  self.restaurant = restaurant
        favoriteName.text = restaurant.name
        favoriteImage.load(url: restaurant.coverImage)
        loveItButton.isFilled = true
    }
    
    // MARK: - Private Functions
    
    @objc
    private func loveIt() {
        loveItButton.toggleIt()
        let value = loveItButton.isFilled
		 guard let restaurant = restaurant else { return }
		 delegate?.setFavorite(restaurant, isFavorite: value)
    }
}

// MARK: - CodeView Protocol

extension FavoritesCell: CodeView {
    
    func buildViewHierarchy() {
        addSubview(contentCard)
        contentCard.addSubview(favoriteCard)
        favoriteCard.addSubview(favoriteName)
        favoriteCard.addSubview(favoriteImage)
        favoriteCard.addSubview(loveItButton)
    }
    
    func setupConstraints() {
        contentCard.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
        
        favoriteCard.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
        
        favoriteImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        favoriteName.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(16)
            make.top.equalTo(favoriteImage.snp.bottom).offset(16)
        }
        
        loveItButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.right.equalToSuperview().inset(4)
            make.top.equalTo(favoriteImage.snp.bottom).inset(15)
        }
    }
    
    func setupAdditionalConfiguration() {
        loveItButton.addTarget(self, action: #selector(loveIt), for: .touchUpInside)
    }
}
