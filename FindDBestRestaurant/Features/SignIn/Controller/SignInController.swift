//
//  SignInController.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 12/10/21.
//

import Foundation

struct SessionRequest: Encodable {
	let email: String
	let password: String
}

struct SessionResponse: Decodable {
	let token: String
	let user: SessionUser
}

struct SessionUser: Decodable {
	let name: String
	let email: String
}

protocol SignInControllerDelegate: AnyObject {
	func successSession()
	func errorSession()
}

class SignInController {
	
	weak var delegate: SignInControllerDelegate?
	
	init(delegate: SignInControllerDelegate) {
		self.delegate = delegate
	}
	
	func createSession(sessionRequest: SessionRequest) {
		let urlString = "\(API_BASE_URL)/sessions"
		guard let url = URL(string: urlString) else { return }
		
		APIManager.createSession(url: url, body: sessionRequest) { response, error in
			if let result = response {
				TokenUserDefaults.addToken(result.token)
				self.delegate?.successSession()
			} else {
				self.delegate?.errorSession()
			}
		}
	}
	
}
