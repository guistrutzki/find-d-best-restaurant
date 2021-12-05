//
//  URLRequest+ext.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 01/12/21.
//

import Foundation

extension Data {
    func toString() -> String? {
        return String(data: self, encoding: .utf8)
    }
}

extension URLRequest {
    func log() {
        print("\(httpMethod ?? "") \(self)")
        print("BODY \n \(httpBody?.toString() ?? "")")
        print("HEADERS \n \(allHTTPHeaderFields ?? [:])")
    }
}
