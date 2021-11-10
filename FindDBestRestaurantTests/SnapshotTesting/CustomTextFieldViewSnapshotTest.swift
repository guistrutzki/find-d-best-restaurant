//
//  CustomTextFieldViewSnapshotTests.swift
//  FindDBestRestaurantTests
//
//  Created by Alexandre Cardoso on 04/11/21.
//

import XCTest
import SnapshotTesting
import Firebase
@testable import FindDBestRestaurant

class CustomTextFieldViewSnapshotTests: XCTestCase {
	
	var sut: CustomTextFieldView!
	
	override func setUp() {
		let frame = CGRect(x: 0, y: 0, width: 375, height: 50)
		sut = CustomTextFieldView(frame: frame)
	}
	
	override func tearDown() {
		sut = nil
	}
	
	func testCustomTextFieldViewName() {
		sut.configureTextFieldType(.name)
		
		assertSnapshot(matching: sut, as: .image, record: false)
	}
	
	func testCustomTextFieldViewEmail() {
		sut.configureTextFieldType(.email)
		
		assertSnapshot(matching: sut, as: .image, record: false)
	}
	
	func testCustomTextFieldViewPassword() {
		sut.configureTextFieldType(.password)
		
		assertSnapshot(matching: sut, as: .image, record: false)
	}
	
}
