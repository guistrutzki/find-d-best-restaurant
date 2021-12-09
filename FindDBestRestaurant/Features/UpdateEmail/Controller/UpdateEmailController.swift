//
//  UpdateEmailController.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 09/12/21.
//

import Foundation

protocol UpdateEmailControllerDelegate: AnyObject {
    func successUpdate()
    func errorUpdate()
}

class UpdateEmailController {
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol) {
        self.restaurantService = restaurantService
    }
    
    weak var delegate: UpdateEmailControllerDelegate?
    
    func updateUserEmail(_ newEmail: String) -> Void {
        restaurantService.updateEmail(email: newEmail) { [weak self] (result: Result <NoReply?, NetworkError>) in
            guard let self = self else { return }
            switch result {
            case .success(_):
                guard let currSessionData = SessionDataUserDefaults.getData() else { return }
                SessionDataUserDefaults
                    .setData(SessionResponse(token: currSessionData.token,
                                             user: SessionUser(name: currSessionData.user.name,
                                                               email: newEmail)))
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
