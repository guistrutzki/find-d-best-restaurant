//
//  InitialVC.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 28/08/21.
//

import UIKit

class InitialVC: UIViewController {
    
    private lazy var initialScreen: InitialScreen = {
        return InitialScreen(self)
    }()
    
    override func loadView() {
        self.view = initialScreen
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

extension InitialVC: InitialScreenDelegate {
    func didTappedSignIn() {
        print("Navigate to Login")
        let vc: SignInVC = SignInVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTappedSignUp() {
        print("Navigate to SignUp")
        let vc: SignUpVC = SignUpVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTappedForgetPassword() {
        print("Navigate to Forget password")
        let vc: ResetPasswordVC = ResetPasswordVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTappedSignInAsGuest() {
        print("Navigate to TabBar")
        let tabBarController: MainTabBarController = MainTabBarController()
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
}
