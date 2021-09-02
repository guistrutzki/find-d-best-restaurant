//
//  MenuTableCell.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 02/09/21.
//

import UIKit

class MenuTableCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier: String = String(describing: MenuTableCell.self)
    
    // MARK: - UI Element
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(
            frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        return collection
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

extension MenuTableCell: CodeView {
    func buildViewHierarchy() {
        addSubview(collection)
    }
    
    func setupConstraints() {
        collection.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        MenuCollectionCell.registerOn(collection)
        backgroundColor = .systemPink
    }
    
    
}

// MARK: - UICollectionViewDataSource Extension

extension MenuTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = MenuCollectionCell.identifier
        
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MenuCollectionCell else { return UICollectionViewCell()}
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Extension

extension MenuTableCell: UICollectionViewDelegateFlowLayout {
    
    private var margin: CGFloat { 4.0 }
    
    private var insetForSections: UIEdgeInsets {
        UIEdgeInsets(top: margin, left:margin, bottom: margin, right: margin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding = insetForSections.left + insetForSections.right + margin
        let width = (bounds.size.width - padding) / 2
        let ratio: CGFloat = 1.5
        let height = width * ratio
        
        return CGSize(width: width, height: height)
    }
}

