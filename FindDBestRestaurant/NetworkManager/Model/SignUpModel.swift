//
//  SignUpModel.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 12/09/21.
//

import Foundation

struct SignUpModel: Encodable {
    let name: String
    let email: String
    let password: String
}
