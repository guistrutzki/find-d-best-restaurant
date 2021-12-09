//
//  UpdatePasswordController.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 09/12/21.
//

import Foundation

protocol UpdatePasswordControllerDelegate: AnyObject {
    func successUpdate()
    func errorUpdate()
}

class UpdatePasswordController {
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol) {
        self.restaurantService = restaurantService
    }
    
    weak var delegate: UpdatePasswordControllerDelegate?
    
    func updateUserPassword(_ newPassword: String) -> Void {
        restaurantService.updateEmail(email: newPassword) { [weak self] (result: Result <NoReply?, NetworkError>) in
            guard let self = self else { return }
            switch result {
            case .success(_):
                self.delegate?.successUpdate()
                break
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.errorUpdate()
                break
            }
        }
    }
}
