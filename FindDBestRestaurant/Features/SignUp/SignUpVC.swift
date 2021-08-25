//
//  SignUpVC.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 24/08/21.
//

import UIKit

class SignUpVC: UIViewController {
    
    // MARK: - UI Element
    
    lazy var signUpScreen: SignUpScreen = {
        let view = SignUpScreen(self)
        return view
    }()
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = signUpScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: - Private Functions
    
    private func configureView() {
        title = K.SignUpVCTitle
    }
    
    private func didCreateAccountWithSuccess() {
        showMessage(
            title: K.accountCreated,
            message: K.accountSuccessMessage)
    }
}

// MARK: - Extension SignUpScreenDelegate

extension SignUpVC: SignUpScreenDelegate {
    
    func didTappedSignUpButton() {
        didCreateAccountWithSuccess()
        #warning("Chamar a Controller aqui pra fazer a ação")
    }
}
