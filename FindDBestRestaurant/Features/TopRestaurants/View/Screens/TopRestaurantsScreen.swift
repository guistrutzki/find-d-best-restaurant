//
//  TopRestaurantsScreen.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 06/09/21.
//

import UIKit
import MapKit

protocol TopRestaurantsScreenDelegate: AnyObject {
	func didTappedLocation()
}

class TopRestaurantsScreen: UIView {
	
	// MARK: - UI Elements
	private lazy var mapView: MKMapView = {
		let map = MKMapView(frame: .zero)
		map.overrideUserInterfaceStyle = .dark
		return map
	}()
	
	private lazy var locationView: UIView = {
		let view = UIView(frame: .zero)
		view.backgroundColor = Colors.gray800
		view.layer.cornerRadius = 12
		let tap = UITapGestureRecognizer(target: self, action: #selector(didTappedLocation(_:)))
		view.addGestureRecognizer(tap)
		return view
	}()
	
	private var locationImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.image = UIImage(systemName: "location")
		imageView.tintColor = .white
		return imageView
	}()
	
	private lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collection.backgroundColor = .clear
		collection.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
		collection.showsHorizontalScrollIndicator = false
		return collection
	}()
	
	private weak var delegate: TopRestaurantsScreenDelegate?
	
	private var listAnnotations = [MKPointAnnotation]()
		
	// MARK: - Initialize
	init(delegate: TopRestaurantsScreenDelegate?) {
		super.init(frame: .zero)
		self.delegate = delegate
		setupView()
	}
	
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
	
	func reloadData() {
		DispatchQueue.main.async {
			self.collectionView.reloadData()
		}
	}
	
	func showsUserLocation() {
		mapView.showsUserLocation = true
	}
	
	func centerViewOnUserLocation(_ locationManager: CLLocationManager) {
		if let location = locationManager.location?.coordinate {
			let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 5000,
															 longitudinalMeters: 5000)
			mapView.setRegion(region, animated: true)
		}
	}
	
	func centerViewOnRestaurant(_ restaurant: RestaurantListResponse) {
		let latitude = CLLocationDegrees(restaurant.lat) ?? 0
		let longitude = CLLocationDegrees(restaurant.lng) ?? 0
		let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 100,
														 longitudinalMeters: 100)
		
		mapView.setRegion(region, animated: true)
	}
	
	func addAnnotation(restaurant: RestaurantListResponse) {
		let annotation = MKPointAnnotation()
		let latitude = CLLocationDegrees(restaurant.lat) ?? 0
		let longitude = CLLocationDegrees(restaurant.lng) ?? 0
		let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		annotation.coordinate = coordinate
		annotation.title = restaurant.name
		annotation.subtitle = restaurant.description
		
		mapView.addAnnotation(annotation)
		listAnnotations.append(annotation)
	}
	
	func showAnnotations() {
		DispatchQueue.main.async {
			self.mapView.showAnnotations(self.listAnnotations, animated: true)
		}
	}
	
	
	@objc
	func didTappedLocation(_ sender: UITapGestureRecognizer) {
		self.delegate?.didTappedLocation()
	}
	
}

// MARK: - Extension CodeView
extension TopRestaurantsScreen: CodeView {
	
	func buildViewHierarchy() {
		addSubview(mapView)
		addSubview(collectionView)
		addSubview(locationView)
		locationView.addSubview(locationImageView)
	}
	
	func setupConstraints() {
		mapView.snp.makeConstraints { make in
			make.top.equalTo(safeAreaLayoutGuide.snp.top)
			make.left.right.equalToSuperview()
			make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
		}
		
		collectionView.snp.makeConstraints { make in
			make.left.right.equalToSuperview()
			make.bottom.equalTo(mapView.snp.bottom).inset(10)
			make.height.equalTo(110)
		}
		
		locationView.snp.makeConstraints { make in
			make.top.equalTo(mapView.snp.top).offset(20)
			make.right.equalTo(mapView.snp.right).inset(10)
			make.height.equalTo(60)
			make.width.equalTo(50)
		}
		
		locationImageView.snp.makeConstraints { make in
			make.top.equalTo(locationView.snp.top).offset(15)
			make.left.equalTo(locationView.snp.left).offset(10)
			make.right.equalTo(locationView.snp.right).inset(10)
			make.bottom.equalTo(locationView.snp.bottom).inset(15)
		}
		
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = Colors.gray800
		TopRestaurantsCollectionCell.registerOn(collectionView)
	}
	
}
