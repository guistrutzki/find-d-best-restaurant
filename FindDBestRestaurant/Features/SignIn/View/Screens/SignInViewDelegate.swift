//
//  SignInViewDelegate.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 23/08/21.
//

import Foundation
import UIKit

protocol SignInViewDelegate: AnyObject {
    
    func didTappedBackButton()
    
    func didTappedForgetPassword()
    
    func didTappedSignInSubmit(email: String?, password: String?)
}
