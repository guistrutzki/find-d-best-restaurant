//
//  MenuCollectionCell.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 02/09/21.
//

import UIKit

class MenuCollectionCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier: String = String(describing: MenuCollectionCell.self)
    
    // MARK: - UI Element
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray500
        view.layer.cornerRadius = 12
        return view
    }()

    private lazy var menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "rest-1")
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Nome do restaurante"
        return label
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}

// MARK: - CodeView Extension

extension MenuCollectionCell: CodeView {
    
    func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(menuImageView)
        containerView.addSubview(itemNameLabel)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(16)
            make.bottom.right.equalToSuperview().inset(16)
        }

        menuImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(104)
            make.width.equalTo(170)
        }
        
        itemNameLabel.snp.makeConstraints { make in
            make.top.equalTo(menuImageView.snp.bottom).offset(8)
            make.bottom.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        // Not implemented
    }
    
    func configureCell(restaurant: RestaurantListResponse, index: IndexPath) {
           let image = restaurant.menu[index.row].image ?? ""
           let title = restaurant.menu[index.row].title ?? ""
           menuImageView.load(url: image)
           itemNameLabel.text = title
       }
}
