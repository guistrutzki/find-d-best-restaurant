//
//  FBREmptyStateScreen.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 09/09/21.
//

import UIKit

class FBREmptyStateScreen: UIView {
    
    // MARK: - UI Elements
    
    private lazy var emptyFavoriteImage: UIImageView = {
        let image = UIImageView()
        image.image = Images.favoritePlace
        return image
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = K.youDontHaveAFavorite
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.text = K.whatAboutStartNow
        label.textColor = .secondaryLabel
        return label
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

// MARK: - CodeView extension

extension FBREmptyStateScreen: CodeView {
    
    func buildViewHierarchy() {
        addSubview(emptyFavoriteImage)
        addSubview(title)
        addSubview(subtitle)
    }
    
    func setupConstraints() {
        emptyFavoriteImage.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(400)
        }
        
        title.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(emptyFavoriteImage.snp.bottom).offset(16)
        }
        
        subtitle.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(title.snp.bottom).offset(8)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .systemBackground
    }
}
