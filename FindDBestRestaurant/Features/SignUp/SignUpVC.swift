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
//		configureDelegates()
	}
	
	
	// MARK: - Function
	private func configureView() {
		title = "Cadastro"
		view.backgroundColor = .darkGray
	}
	
//	private func configureDelegates() {
//		self.signUpScreen.nameTextField.customTextField.delegate = self
//		self.signUpScreen.emailTextField.customTextField.delegate = self
//		self.signUpScreen.passwordTextField.customTextField.delegate = self
//	}
	
	
//	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//		self.signUpScreen.nameTextField.customTextField.resignFirstResponder()
//		self.signUpScreen.emailTextField.customTextField.resignFirstResponder()
//		self.signUpScreen.passwordTextField.customTextField.resignFirstResponder()
//	}
	
    private func didCreateAccountWithSuccess() {
        showMessage(
            title: K.accountCreated,
            message: K.accountSuccessMessage)
    }
}

// MARK: - Extension UITextField

extension SignUpVC: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}

// MARK: - Extension SignUpScreenDelegate

extension SignUpVC: SignUpScreenDelegate {
    
    func didTappedSignUpButton() {
        didCreateAccountWithSuccess()
        #warning("Chamar a Controller aqui pra fazer a ação")
    }
}
