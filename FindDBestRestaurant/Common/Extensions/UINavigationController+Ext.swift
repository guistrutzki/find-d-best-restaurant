//
//  UINavigationController+Ext.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 19/10/21.
//

import UIKit

extension UINavigationController {
	func setNavigationBarStyleDefault() {
		let navBarAppearanceTransition = UINavigationBarAppearance()
		let navBarAppearance = UINavigationBarAppearance()
		
		navBarAppearanceTransition.backgroundColor = Colors.gray800
		navBarAppearanceTransition.titleTextAttributes = [.foregroundColor: Colors.white]
		navBarAppearanceTransition.largeTitleTextAttributes = [.foregroundColor: Colors.white]
		navBarAppearanceTransition.backgroundEffect = nil
		
		navBarAppearance.backgroundColor = Colors.gray500
		navBarAppearance.titleTextAttributes = [.foregroundColor: Colors.white]
		navBarAppearance.largeTitleTextAttributes = [.foregroundColor: Colors.white]
		navBarAppearance.backgroundEffect = nil
		
		self.navigationBar.scrollEdgeAppearance = navBarAppearance
		self.navigationBar.compactAppearance    = navBarAppearanceTransition
		self.navigationBar.standardAppearance   = navBarAppearanceTransition
		self.navigationBar.scrollEdgeAppearance = navBarAppearance
	}
}
