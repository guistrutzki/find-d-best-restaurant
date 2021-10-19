//
//  TokenUserDefaults.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 12/10/21.
//

import Foundation

class TokenUserDefaults {
	
	static func addToken(_ token: String) {
		UserDefaults.standard.set(token, forKey: "Token")
	}
	
	static func getToken() -> String? {
		return UserDefaults.standard.string(forKey: "Token")
	}
	
	static func deleteToken() {
		UserDefaults.standard.removeObject(forKey: "Token")
	}
	
}
