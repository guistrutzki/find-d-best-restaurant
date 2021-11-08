//
//  FavoriteRealm.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 02/11/21.
//

import Foundation
import RealmSwift

class FavoriteRealm: Object {
	@objc dynamic var idRestaurant: String = ""
}
