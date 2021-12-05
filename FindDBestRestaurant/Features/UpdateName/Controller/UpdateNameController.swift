//
//  UpdateNameController.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 02/12/21.
//

import Foundation

protocol UpdateNameControllerDelegate: AnyObject {
    func successUpdate()
    func errorUpdate()
}

class UpdateNameController {
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol) {
        self.restaurantService = restaurantService
    }
    
    weak var delegate: UpdateNameControllerDelegate?
    
    func updateUserName(_ name: String) -> Void {
        restaurantService.updateUserName(name: name) { [weak self] (result: Result <NoReply?, NetworkError>) in
            guard let self = self else { return }
            switch result {
            case .success(_):
                guard let currSessionData = SessionDataUserDefaults.getData() else { return }
                SessionDataUserDefaults
                    .setData(SessionResponse(token: currSessionData.token,
                                             user: SessionUser(name: name,
                                                               email: currSessionData.user.email)))
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
