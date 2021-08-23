//
//  SignInVC.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 23/08/21.
//

import UIKit

class SignInVC: UIViewController {
    
    var signInScreen: SignInScreen?
    
    override func loadView() {
        self.signInScreen = SignInScreen()
        self.view = self.signInScreen
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
