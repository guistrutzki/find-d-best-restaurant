//
//  Encodable+ext.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 02/12/21.
//

import Foundation

extension Encodable {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
