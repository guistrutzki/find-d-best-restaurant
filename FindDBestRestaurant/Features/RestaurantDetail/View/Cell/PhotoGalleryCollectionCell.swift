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

    private lazy var menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = Images.restaurant3
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
}

// MARK: - CodeView Extension

extension PhotoGalleryCollectionCell: CodeView {
    
    func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(menuImageView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.bottom.right.equalToSuperview().inset(8)
        }
        
        menuImageView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
