//
//  PhotoGalleryTableCell.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 02/09/21.
//

import UIKit

protocol PhotoGalleryTableCellDelegate: AnyObject {
    
    func getGalleryNumberOfItems() -> Int?
    
    func getRestaurants(index: IndexPath) -> RestaurantListResponse?
}

class PhotoGalleryTableCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier: String = String(describing: PhotoGalleryTableCell.self)
    
    // MARK: - UI Element
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .white
        label.text = K.photoGallery
        return label
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.clipsToBounds = false
        collectionView.bounces = true
        collectionView.alwaysBounceHorizontal = true
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    weak var delegate: PhotoGalleryTableCellDelegate?
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - CodeView Extension

extension PhotoGalleryTableCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(collection)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        collection.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        PhotoGalleryCollectionCell.registerOn(collection)
        backgroundColor = Colors.gray800
    }
}

// MARK: - UICollectionViewDataSource Extension

extension PhotoGalleryTableCell: UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.getGalleryNumberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = PhotoGalleryCollectionCell.identifier
        
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? PhotoGalleryCollectionCell else { return UICollectionViewCell()}

        if let restaurant = delegate?.getRestaurants(index: indexPath) {
            cell.configureCell(restaurant: restaurant)
        }
           
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Extension

extension PhotoGalleryTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 145, height: 270)
    }
}
