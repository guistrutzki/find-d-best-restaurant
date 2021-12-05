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
	
	static func createSession(url: URL, body: SessionRequest,
									  completion: @escaping(SessionResponse?, Error?) -> Void) {
			
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		
		do {
			let jsonData = try JSONEncoder().encode(body)
			request.httpBody = jsonData
			request.addValue("application/json", forHTTPHeaderField: "Content-Type")
			request.addValue("application/json", forHTTPHeaderField: "Accept")
			
		} catch let error {
			completion(nil, error)
		}
		
		let task = URLSession.shared.dataTask(with: request) { data, response, error in
			
			if let error = error {
				completion(nil, error)
			}
			
			if let status = response as? HTTPURLResponse, !(200...299).contains(status.statusCode) {
				completion(nil, error)
			}
			
			if let data = data {
				do {
					let result = try JSONDecoder().decode(SessionResponse.self, from: data)
					completion(result, nil)
					
				} catch let error {
					print("Erro Session \(error.localizedDescription)")
					completion(nil, error)
				}
			}
			
		}
		task.resume()
		
	}
}
