//
//  FavoritesView.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 09/09/21.
//

import UIKit
import SnapKit

class FavoritesScreen: UIView {
    
    // MARK: - UI Components
    
    private lazy var emptyFavoritesScreen: FBREmptyStateScreen = {
        let view = FBREmptyStateScreen(frame: .zero)
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: layout
		  )
        collectionView.delegate = self
        collectionView.dataSource = self
		  collectionView.backgroundColor = Colors.gray500
        return collectionView
    }()
    
    // MARK: - Variable
    
    weak var delegate: FavoritesScreenDelegate?
    
    // MARK: - Inits
    
    init(_ delegate: FavoritesScreenDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Public Functions
    
    func updateData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func setUIState(_ isHidden: Bool) {
        emptyFavoritesScreen.isHidden = !isHidden
        collectionView.isHidden = isHidden
    }
    
    // MARK: - Private Functions
    
    private func fetchCharacterNextPage() {
        delegate?.fetchCharacterNextPage()
    }
    
    private func selectCharacter(at index: Int) {
        delegate?.selectCharacter(at: index)
    }
}

// MARK: - UICollectionViewDelegate Extension

extension FavoritesScreen: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        let lastRowIndex = collectionView.numberOfItems(
            inSection: indexPath.section) - 1
        
        if lastRowIndex == indexPath.row {
            // fetchCharacterNextPage()
        }
        
        cell.alpha = 0.0
        cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .allowUserInteraction, animations: {
            cell.alpha = 1.0
            cell.transform = .identity
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectCharacter(at: indexPath.item)
    }
}

// MARK: - UICollectionViewDataSource Extension

extension FavoritesScreen: UICollectionViewDataSource {
    
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		guard let count = delegate?.setListCount() else { return 0 }
		
		if count == 0 {
			setUIState(true)
		} else {
			setUIState(false)
		}
		
		return count
	}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = FavoritesCell.identifier
        
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: identifier, for: indexPath) as? FavoritesCell
        else { return UICollectionViewCell() }
        
        cell.delegate = self
        guard let favorite = delegate?.getFavorites(index: indexPath.item) else { return UICollectionViewCell()}
        cell.setup(favorite)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Extension

extension FavoritesScreen: UICollectionViewDelegateFlowLayout {
    
    private var margin: CGFloat { 16.0 }
    
    private var insetForSections: UIEdgeInsets {
        UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
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

// MARK: - CharacterCellDelegate Extension

extension FavoritesScreen: FavoritesCellDelegate {
	
	func setFavorite(_ restaurant: RestaurantListResponse, isFavorite: Bool) {
		delegate?.setFavorite(restaurant, isFavorite: isFavorite)
	}
	
	func setFavorite(_ cell: UICollectionViewCell, value: Bool) {
		guard let indexPath = collectionView.indexPath(for: cell) else { return }
		delegate?.setFavorite(at: indexPath.item, isFavorite: value)
	}
	
}

// MARK: - CodeView Extension

extension FavoritesScreen : CodeView {
    
    func buildViewHierarchy() {
        addSubview(collectionView)
        addSubview(emptyFavoritesScreen)
    }
    
    func setupConstraints() {
        emptyFavoritesScreen.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(48)
            make.left.right.bottom.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
			  make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func setupAdditionalConfiguration() {
        emptyFavoritesScreen.isHidden = true
 		  backgroundColor = Colors.gray500
        FavoritesCell.registerOn(collectionView)
    }
}

