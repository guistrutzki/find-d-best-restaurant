//
//  NetworkError.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 29/11/21.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case noData
    case invalidStatusCode(code: Int)
    case custom(error: Error)
}
