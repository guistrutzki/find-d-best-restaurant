//
//  SessionModel.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 30/11/21.
//

import Foundation

struct SessionRequest: Encodable {
    let email: String
    let password: String
}

struct SessionResponse: Decodable {
    let token: String
    let user: SessionUser
}

struct SessionUser: Decodable {
    let name: String
    let email: String
}
