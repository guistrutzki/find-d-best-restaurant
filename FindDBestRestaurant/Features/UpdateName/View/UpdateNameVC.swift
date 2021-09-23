//
//  UpdateNameVC.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 22/09/21.
//

import UIKit

class UpdateNameVC: UIViewController {
    
    private lazy var updateNameScreen: UpdateNameScreen = {
        return UpdateNameScreen(self)
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
        print("\(name ?? "")")
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
