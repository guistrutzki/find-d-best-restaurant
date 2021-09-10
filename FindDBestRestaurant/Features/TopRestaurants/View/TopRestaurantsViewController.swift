//
//  TopRestaurantsViewController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 21/08/21.
//

import UIKit
import MapKit


class TopRestaurantsViewController: UIViewController {
	
	// MARK: - Elements
	private lazy var topRestaurantScreen: TopRestaurantsScreen = {
		let screen = TopRestaurantsScreen(delegate: self)
		screen.configureDelegateMapKit(delegate: self)
		screen.configureDelegateCollectionView(delegate: self, dataSource: self)
		return screen
	}()
	private lazy var controller: TopRestaurantsController = {
		let controller = TopRestaurantsController()
		controller.delegate = self
		return controller
	}()
	
	private let locationManager = CLLocationManager()
	
	// MARK: - Life cycle
	override func loadView() {
		self.view = topRestaurantScreen
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.isNavigationBarHidden = true
		checkLocationManager()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		controller.loadRestaurantList()
		self.topRestaurantScreen.centerViewOnUserLocation(locationManager)
	}
	
	// MARK: - Function
	private func setupLocationManager() {
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
	}
	
	private func checkLocationManager() {
		if CLLocationManager.locationServicesEnabled() {
			setupLocationManager()
			checkLocationAuthorization()
		}
	}
	
	private func checkLocationAuthorization() {
		switch locationManager.authorizationStatus {
			case .authorizedWhenInUse:
				self.topRestaurantScreen.showsUserLocation()
				self.topRestaurantScreen.centerViewOnUserLocation(locationManager)
				//				locationManager.startUpdatingLocation()
				break
			case .denied:
				break
			case .notDetermined:
				locationManager.requestWhenInUseAuthorization()
			default:
				break
		}
	}
	
	private func createAnnotationRestaurant(_ listRestaurant: [RestaurantListResponse]) {
		listRestaurant.forEach { restaurant in
			self.topRestaurantScreen.addAnnotation(restaurant: restaurant)
		}
	}
	
}

// MARK: - Extension MKMapViewDelegate
extension TopRestaurantsViewController: MKMapViewDelegate {
}

// MARK: - Extension UICollectionViewDelegate
extension TopRestaurantsViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let restaurant = controller.getRestaurants(indexPath: indexPath)
		self.topRestaurantScreen.centerViewOnRestaurant(restaurant)
	}
	
}

// MARK: - Extension UICollectionViewDataSource
extension TopRestaurantsViewController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return controller.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let restaurant = controller.getRestaurants(indexPath: indexPath)
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopRestaurantsCollectionCell.identifier,
																			 for: indexPath) as? TopRestaurantsCollectionCell
		else { return UICollectionViewCell() }
		
		cell.setupCell(restaurant: restaurant)
		
		return cell
	}
	
}

// MARK: - Extension UICollectionViewDataSource
extension TopRestaurantsViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 300, height: 110)
	}
	
}

// MARK: - Extension CLLocationManagerDelegate
extension TopRestaurantsViewController: CLLocationManagerDelegate {
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		//		self.topRestaurantScreen.centerViewOnUserLocation(manager)
	}
	
	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		checkLocationAuthorization()
	}
	
}

// MARK: - Extension TopRestaurantsControllerDelegate
extension TopRestaurantsViewController: TopRestaurantsControllerDelegate {
	
	func successLoad(_ list: [RestaurantListResponse]) {
		createAnnotationRestaurant(list)
		self.topRestaurantScreen.reloadData()
	}
	
	func errorLoad() {
		print(#function)
	}
	
}

// MARK: - Extension TopRestaurantsScreen
extension TopRestaurantsViewController: TopRestaurantsScreenDelegate {
	
	func didTappedLocation() {
		self.topRestaurantScreen.centerViewOnUserLocation(locationManager)
	}
	
}
