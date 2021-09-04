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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Menu"
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(collection)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        collection.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        MenuCollectionCell.registerOn(collection)
        backgroundColor = Colors.gray800
    }
}

// MARK: - UICollectionViewDataSource Extension

extension MenuTableCell: UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = MenuCollectionCell.identifier
        
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MenuCollectionCell else { return UICollectionViewCell()}
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Extension

extension MenuTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
