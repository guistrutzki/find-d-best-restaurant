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
        view.backgroundColor = Colors.gray300
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()

    private lazy var menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "rest-1")
        return imageView
    }()
    
    private lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 12)
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
        containerView.addSubview(cardView)
        cardView.addSubview(menuImageView)
        containerView.addSubview(itemNameLabel)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(5)
            make.bottom.right.equalToSuperview().inset(5)
        }
        
        cardView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        
        menuImageView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        itemNameLabel.snp.makeConstraints { make in
            make.top.equalTo(menuImageView.snp.bottom).offset(8)
        }
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
