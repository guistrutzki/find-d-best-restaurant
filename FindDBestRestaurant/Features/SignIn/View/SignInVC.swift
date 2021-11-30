//
//  SignInVC.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 23/08/21.
//

import UIKit

class SignInVC: UIViewController {
    
    // MARK: - Variable
    
    private lazy var signInScreen: SignInScreen = {
        return SignInScreen(self)
    }()
	private lazy var controller: SignInController = {
		let controller = SignInController(delegate: self)
		return controller
	}()
	    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = signInScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

}

// MARK: - SignInViewDelegate Extension

extension SignInVC: SignInViewDelegate {
    
    func didTappedBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func didTappedSignInSubmit(email: String?, password: String?) {
		 guard let _email = email, let _password = password else { return }
		 let sessionRequest = SessionRequest(email: _email, password: _password)
		 controller.authenticateUser(sessionRequest: sessionRequest)
    }
    
    func didTappedForgetPassword() {
        print("forget password")
    }
}

// MARK: - Extension SignInControllerDelegate
extension SignInVC: SignInControllerDelegate {
	
	func successSession() {
		print("Session criada com Sucesso")
		
		let token = TokenUserDefaults.getToken()
		let tabBarController: MainTabBarController = MainTabBarController(token: token)
		DispatchQueue.main.async {
			self.navigationController?.pushViewController(tabBarController, animated: true)
		}
	}
	
	func errorSession() {
		print("Erro na criacao da Session")
	}
	
}
