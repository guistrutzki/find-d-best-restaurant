//
//  SignInVC.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 23/08/21.
//

import UIKit

class SignInVC: UIViewController {
    
    private lazy var signInScreen: SignInScreen = {
        return SignInScreen(self)
    }()
    
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

extension SignInVC: SignInViewDelegate {
    func didTappedSignInSubmit(email: String?, password: String?) {
        print("\(email ?? "") - \(password ?? "")")
    }
    
    func didTappedForgetPassword() {
        print("forget password")
    }
}
