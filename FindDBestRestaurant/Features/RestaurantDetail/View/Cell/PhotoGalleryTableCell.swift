//
//  PhotoGalleryTableCell.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 02/09/21.
//

import UIKit

class PhotoGalleryTableCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier: String = String(describing: PhotoGalleryTableCell.self)
    
    // MARK: - UI Element
    
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
        return collectionView
    }()

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
        contentView.addSubview(collection)
    }
    
    func setupConstraints() {
        collection.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = PhotoGalleryCollectionCell.identifier
        
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? PhotoGalleryCollectionCell else { return UICollectionViewCell()}
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Extension

extension PhotoGalleryTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 145, height: 255)
    }
}

