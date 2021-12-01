//
//  SessionDataUserDefaults.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 01/12/21.
//

import Foundation

class SessionDataUserDefaults {
    static func setData(_ data: SessionResponse) {
        do {
            try UserDefaults.standard.setObject(data, forKey: "SessionData")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func getData() -> SessionResponse? {
        do {
            let data = try UserDefaults.standard.getObject(forKey: "SessionData",
                                                           castTo: SessionResponse.self)
            return data
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    static func clearData() {
        UserDefaults.standard.removeObject(forKey: "SessionData")
    }
    
}
