//
//  PhotoGalleryCollectionCell.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 02/09/21.
//

import UIKit

class PhotoGalleryCollectionCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier: String = String(describing: PhotoGalleryCollectionCell.self)
    
    // MARK: - UI Element
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray300
        view.layer.cornerRadius = 12
        return view
    }()

    private lazy var galleryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = Images.restaurant1
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func configureCell(restaurant: RestaurantListResponse) {
        let image = restaurant.gallery.first ?? ""
        galleryImageView.load(url: image)
    }
}

// MARK: - CodeView Extension

extension PhotoGalleryCollectionCell: CodeView {
    
    func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(galleryImageView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(8)
            make.bottom.right.equalToSuperview().inset(8)
        }
        
        galleryImageView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
