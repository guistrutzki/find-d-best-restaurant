//
//  UpdateEmailVC.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 05/12/21.
//

import UIKit

protocol UpdateEmailDelegate: AnyObject {
    func updateHeaderContent(data: SessionResponse?)
}

class UpdateEmailVC: UIViewController {
    weak var delegate: UpdateEmailDelegate?
    
    private lazy var updateEmailScreen: UpdateEmailScreen = {
        return UpdateEmailScreen(self)
    }()
    
    private lazy var controller: UpdateEmailController = {
        let restaurantService = RestaurantService()
        let controller = UpdateEmailController(restaurantService: restaurantService)
        controller.delegate = self
        return controller
    }()
    
    override func loadView() {
        self.view = updateEmailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UpdateEmailVC: UpdateEmailScreenDelegate {
    func didTappedSaveButton(email: String?) {
        guard let email = email else { return }
        controller.updateUserEmail(email)
    }
}

extension UpdateEmailVC: UpdateEmailControllerDelegate {
    func successUpdate() {
        DispatchQueue.main.async {
            guard let sessionData = SessionDataUserDefaults.getData() else { return }
            self.delegate?.updateHeaderContent(data: sessionData)
            self.presentingViewController?.dismiss(animated: true, completion: nil)
            
        }
    }
    
    func errorUpdate() {
        print("ERROR")
    }
    
    
}
