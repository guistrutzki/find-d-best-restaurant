//
//  SignUpVC.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 24/08/21.
//

import UIKit

class SignUpVC: UIViewController {
    
    let controller = SignUpController()
    
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Private Functions
    
    private func configureView() {
        title = K.signUpVCTitle
    }
    
    private func didCreateAccountWithSuccess() {
        showMessage(
            title: K.accountCreated,
            message: K.accountSuccessMessage)
    }
    
    private func didCreateAccountFailed() {
        showMessage(
            title: "Algo deu errado",
            message: "Tente novamente")
    }
}

// MARK: - Extension SignUpScreenDelegate

extension SignUpVC: SignUpScreenDelegate {
    
    func didTappedBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func didTappedSignUpButton() {
        let name = signUpScreen.getUserName()
        let email = signUpScreen.getUserEmail()
        let password = signUpScreen.getUserPassword()
        
        controller.createNewAccount(name: name, email: email, password: password) { isSuccess in
            if isSuccess {
                self.didCreateAccountWithSuccess()
            } else {
                self.didCreateAccountFailed()
            }
        }
        
    }
}
