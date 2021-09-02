//
//  InitialScreenDelegate.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 28/08/21.
//

import Foundation

protocol InitialScreenDelegate: AnyObject {
    func didTappedSignIn()
    func didTappedSignUp()
    func didTappedForgetPassword()
    func didTappedSignInAsGuest()
}
