//
//  RestaurantService.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 28/11/21.
//

import Foundation

protocol RestaurantServiceProtocol {
    func fetchRestaurants(_ completion: @escaping (Result<[RestaurantListResponse]?, NetworkError>) -> Void)
}

struct RestaurantService: RestaurantServiceProtocol {
    let networkClient = NetworkClient()
    
    func fetchRestaurants(_ completion: @escaping (Result<[RestaurantListResponse]?, NetworkError>) -> Void) {
        let url = URL(string: "\(API_BASE_URL)/restaurants")!
        let token = TokenUserDefaults.getToken() ?? ""
        let headers: [String: String] = ["Authorization": Bool(token) ?? false ? "Bearer \(token)" : "Guest"]
        
        networkClient.performRequest(method: .get,
                                     url: url,
                                     urlParameters: [:],
                                     headers: headers,
                                     completion: completion)
    }
}
