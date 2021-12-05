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
    
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}

struct SessionResponse: Codable {
    let token: String
    let user: SessionUser
}

struct SessionUser: Codable {
    let name: String
    let email: String
}
