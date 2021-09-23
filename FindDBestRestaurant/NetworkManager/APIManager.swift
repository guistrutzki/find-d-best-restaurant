//
//  APIManager.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 12/09/21.
//

import Foundation
import Alamofire

class APIManager {
    static let shareInstance = APIManager()
    
    func callSignUpAPI(register: SignUpModel, completionHandler: @escaping (Bool) -> ()){
        let headers: HTTPHeaders = [.contentType("application/json")]
        
        AF.request(
            "\(API_BASE_URL)/users",
            method: .post,
            parameters: register,
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
        .response { response in
            switch response.result {
            case .success(_):
                if response.response?.statusCode == 201 {
                    completionHandler(true)
                } else {
                    completionHandler(false)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(false)
            }
        }
    }
}
