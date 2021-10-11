//
//  SignUpController.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 12/09/21.
//

import Foundation

class SignUpController {
   public func createNewAccount(name: String, email: String, password: String, completionHandler: @escaping (Bool) -> ()) {
        let reqBody = SignUpModel(name: name, email: email, password: password)
    
        APIManager.shareInstance.callSignUpAPI(register: reqBody) { isSuccess in
            completionHandler(isSuccess)
        }
    }
}
