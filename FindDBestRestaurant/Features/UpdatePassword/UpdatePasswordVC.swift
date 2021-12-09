//
//  UpdatePasswordVC.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 09/12/21.
//

import UIKit

class UpdatePasswordVC: UIViewController {
    private lazy var updatePasswordScreen: UpdatePasswordScreen = {
        return UpdatePasswordScreen(self)
    }()
    
    private lazy var controller: UpdatePasswordController = {
        let restaurantService = RestaurantService()
        let controller = UpdatePasswordController(restaurantService: restaurantService)
        controller.delegate = self
        return controller
    }()
    
    override func loadView() {
        self.view = updatePasswordScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UpdatePasswordVC: UpdatePasswordScreenDelegate {
    func didTappedSaveButton(password: String?) {
        guard let password = password else { return }
        controller.updateUserPassword(password)
    }
}

extension UpdatePasswordVC: UpdatePasswordControllerDelegate {
    func successUpdate() {
        DispatchQueue.main.async {
            // SHOW ALERT
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    func errorUpdate() {
        print("ERROR")
    }
}
