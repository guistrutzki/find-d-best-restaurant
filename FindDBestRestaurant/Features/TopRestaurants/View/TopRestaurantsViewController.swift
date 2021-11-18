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
	
	private var token: String?
	
	init(token: String?) {
		self.token = token
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
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
		controller.loadRestaurantList(token: token)
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
	
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		guard let locationUser = locationManager.location?.coordinate else { return nil }
		
		if annotation.coordinate.latitude != locationUser.latitude
				&& annotation.coordinate.longitude != locationUser.longitude {
			let identifier = "AnnotationPin"
			let view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
			view.canShowCallout = true
			view.calloutOffset = CGPoint(x: -5, y: 5)
			view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
			return view
		}
		
		return nil
	}
	
	func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
		guard let locationAnnotation = view.annotation?.coordinate else { return }
		
		let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
		let placemark = MKPlacemark(coordinate: locationAnnotation)
		let mapItem = MKMapItem(placemark: placemark)
		mapItem.name = view.annotation?.title ?? "Destino"
		mapItem.openInMaps(launchOptions: launchOptions)
	}
	
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
