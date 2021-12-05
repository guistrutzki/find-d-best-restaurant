//
//  UpdateNameVC.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 22/09/21.
//

import UIKit

class UpdateNameVC: UIViewController {
    weak var delegate: UpdateNameDelegate?
    private lazy var updateNameScreen: UpdateNameScreen = {
        return UpdateNameScreen(self)
    }()
    
    private lazy var controller: UpdateNameController = {
        let restaurantService = RestaurantService()
        let controller = UpdateNameController(restaurantService: restaurantService)
        controller.delegate = self
        return controller
    }()
    
    override func loadView() {
        self.view = updateNameScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension UpdateNameVC: UpdateNameScreenDelegate {
    func didTappedSaveButton(name: String?) {
        guard let name = name else { return }
        controller.updateUserName(name)
    }
}

extension UpdateNameVC: UpdateNameControllerDelegate {
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
