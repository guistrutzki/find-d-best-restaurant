//
//  UserModel.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 02/12/21.
//

import Foundation

struct NoReply: Decodable {}

struct UpdateUserNameRequest: Encodable {
    let name: String
}

struct UpdateEmailRequest: Encodable {
    let email: String
}

struct UpdatePasswordRequest: Encodable {
    let password: String
    let oldPassword: String
}
