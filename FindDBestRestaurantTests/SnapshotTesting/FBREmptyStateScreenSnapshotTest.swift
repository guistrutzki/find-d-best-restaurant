//
//  FBREmptyStateScreenSnapshotTest.swift
//  FindDBestRestaurantTests
//
//  Created by Alexandre Cardoso on 04/11/21.
//

import XCTest
import SnapshotTesting
import Firebase
@testable import FindDBestRestaurant

class FBREmptyStateScreenSnapshotTest: XCTestCase {
	
	func testEmptyStateScreen() {
		let frame = CGRect(x: 0, y: 0, width: 375, height: 400)
		let view = FBREmptyStateScreen(frame: frame)
		
		assertSnapshot(matching: view, as: .image, record: false)
	}
	
}
