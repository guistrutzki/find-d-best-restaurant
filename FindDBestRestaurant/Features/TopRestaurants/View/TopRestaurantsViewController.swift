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
		let screen = TopRestaurantsScreen()
		screen.configureDelegateMapKit(delegate: self)
		screen.configureDelegateCollectionView(delegate: self, dataSource: self)
		return screen
	}()
	
	// MARK: - Life cycle
	override func loadView() {
		self.view = topRestaurantScreen
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		navigationController?.isNavigationBarHidden = true
    }
	
	
}

// MARK: - Extension MKMapViewDelegate
extension TopRestaurantsViewController: MKMapViewDelegate {
}

// MARK: - Extension UICollectionViewDelegate
extension TopRestaurantsViewController: UICollectionViewDelegate {
}

// MARK: - Extension UICollectionViewDataSource
extension TopRestaurantsViewController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return UICollectionViewCell()
	}
	
}

// MARK: - Extension UICollectionViewDataSource
extension TopRestaurantsViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 250, height: 110)
	}
	
}
