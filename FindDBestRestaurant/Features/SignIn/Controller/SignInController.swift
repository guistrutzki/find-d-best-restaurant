//
//  SignInController.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 12/10/21.
//

import Foundation

protocol SignInControllerDelegate: AnyObject {
	func successSession()
	func errorSession()
}

class SignInController {
	
	weak var delegate: SignInControllerDelegate?
    private let restaurantService = RestaurantService()
	
	init(delegate: SignInControllerDelegate) {
		self.delegate = delegate
	}
    
    func authenticateUser(sessionRequest: SessionRequest) {
        self.restaurantService.authenticateUser(
            userData: sessionRequest) {[weak self] (result: Result<SessionResponse?, NetworkError>) in
            guard let self = self else { return }
                
            switch result {
            case .success(let data):
                guard let sessionData = data else {
                    self.delegate?.errorSession()
                    return
                }
            
                SessionDataUserDefaults.setData(sessionData)
                self.delegate?.successSession()
                break
            case .failure(let error):
                print(error)
                self.delegate?.errorSession()
                break
            }
           
        }
    }
}
