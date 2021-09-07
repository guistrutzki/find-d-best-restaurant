//
//  TopRestaurantsScreen.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 06/09/21.
//

import UIKit
import MapKit

class TopRestaurantsScreen: UIView {
	
	// MARK: - UI Elements
	private lazy var mapView: MKMapView = {
		let map = MKMapView(frame: .zero)
		map.overrideUserInterfaceStyle = .dark
		map.translatesAutoresizingMaskIntoConstraints = false
		return map
	}()
	
	private lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collection.translatesAutoresizingMaskIntoConstraints = false
		collection.translatesAutoresizingMaskIntoConstraints = false
		collection.backgroundColor = .clear
//		collection.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
		collection.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
		collection.showsHorizontalScrollIndicator = false
		return collection
	}()
		
	// MARK: - Initialize
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Function
	func configureDelegateMapKit(delegate: MKMapViewDelegate?) {
		self.mapView.delegate = delegate
	}
	
	func configureDelegateCollectionView(delegate: UICollectionViewDelegate?,
													 dataSource: UICollectionViewDataSource) {
		self.collectionView.delegate = delegate
		self.collectionView.dataSource = dataSource
	}
	
}

// MARK: - Extension CodeView
extension TopRestaurantsScreen: CodeView {
	
	func buildViewHierarchy() {
		addSubview(mapView)
		addSubview(collectionView)
	}
	
	func setupConstraints() {
		
		NSLayoutConstraint.activate([
			
			mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
			mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
			mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

			collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -40),
			collectionView.heightAnchor.constraint(equalToConstant: 120)
		])
		
//		mapView.snp.makeConstraints { make in
//			make.top.left.right.bottom.equalToSuperview()
//		}
		
//		collectionView.snp.makeConstraints { make in
//			make.left.right.equalToSuperview()
//			make.bottom.equalTo(mapView.snp.bottom).inset(40)
//			make.height.equalTo(120)
//		}
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = Colors.gray800
	}
	
}
