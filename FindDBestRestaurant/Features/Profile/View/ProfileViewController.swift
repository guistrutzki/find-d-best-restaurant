//
//  ProfileViewController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 31/08/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Variable
    
    lazy var profileScreen: ProfileScreen = {
        let screen = ProfileScreen(self)
        return screen
    }()
    
    let controller = ProfileController()
    
    // MARK: - Life cycle
    
    override func loadView() {
        view = profileScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Private Functions
    
    private func proceedToSignIn() {
        let signInViewController = SignInVC()
        navigationController?.pushViewController(signInViewController, animated: true)
    }
    
    private func proceedToSignUp() {
        let signUpViewController = SignUpVC()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    private func proceedToResetPassword() {
        let resetViewController = ResetPasswordVC()
        navigationController?.pushViewController(resetViewController, animated: true)
    }
    
}

extension ProfileViewController: ProfileScreenDelegate {
    
    func goToSignUp() {
        proceedToSignUp()
    }
    
    func gotToSignIn() {
        proceedToSignIn()
    }
    
    func gotToResetPassword() {
        proceedToResetPassword()
    }
}
