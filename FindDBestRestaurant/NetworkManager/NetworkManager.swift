//
//  NetworkManager.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 29/08/21.
//

import Alamofire

typealias NetworkResult = ((Result<RestaurantListResponse, Error>) -> Void)

class NetworkManager {
    
    private init() {}
    
    static func request(url: String, completion: @escaping NetworkResult) {
        let request = AF.request(url, method: .get)
        
        request.validate().responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let data = response.data ?? Data()
                    let result = try JSONDecoder().decode(RestaurantListResponse.self, from: data)
                    
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
