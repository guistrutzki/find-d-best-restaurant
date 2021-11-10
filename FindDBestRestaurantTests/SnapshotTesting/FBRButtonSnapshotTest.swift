//
//  FBRButtonSnapshotTest.swift
//  FindDBestRestaurantTests
//
//  Created by Alexandre Cardoso on 04/11/21.
//

import XCTest
import SnapshotTesting
import Firebase
@testable import FindDBestRestaurant

class FBRButtonSnapshotTest: XCTestCase {
	
	func testButtonCadastrar() {
		let sut = FBRButton(backgroundColor: .red, title: "Cadastrar", titleColor: .white)
		
		assertSnapshot(matching: sut, as: .image(size: CGSize(width: 280, height: 50)), record: false)
	}
	
	func testButtonEntrar() {
		let sut = FBRButton(backgroundColor: .gray, title: "Entrar", titleColor: .red)
		
		assertSnapshot(matching: sut, as: .image(size: CGSize(width: 280, height: 50)), record: false)
	}
	
}
