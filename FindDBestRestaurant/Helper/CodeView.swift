//
//  CodeView.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 22/08/21.
//

import Foundation
 import SnapKit

 protocol CodeView {
	func buildViewHierarchy()
	func setupConstraints()
	func setupAdditionalConfiguration()
	func setupView()
 }

 extension CodeView {
	func setupView() {
		buildViewHierarchy()
		setupConstraints()
		setupAdditionalConfiguration()
	}
 }
