//
//  RestaurantService.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 28/11/21.
//

import Foundation

protocol RestaurantServiceProtocol {
    func fetchRestaurants(_ completion: @escaping (Result<[RestaurantListResponse]?, NetworkError>) -> Void)
    func updateUserName(name: String, _ completion: @escaping (Result<NoReply?, NetworkError>) -> Void)
    func updateEmail(email: String, _ completion: @escaping (Result<NoReply?, NetworkError>) -> Void)
}

struct RestaurantService: RestaurantServiceProtocol {
    let networkClient = NetworkClient()
    
    func fetchRestaurants(_ completion: @escaping (Result<[RestaurantListResponse]?, NetworkError>) -> Void) {
        let url = URL(string: "\(API_BASE_URL)/restaurants")!
        let token = SessionDataUserDefaults.getData()?.token ?? ""
        let headers: [String: String] = ["Authorization": Bool(token) ?? false ? "Bearer \(token)" : "Guest"]
        
        networkClient.performRequest(method: .get,
                                     url: url,
                                     urlParameters: [:],
                                     headers: headers,
                                     body: nil,
                                     completion: completion)
    }
    
    func authenticateUser(userData: SessionRequest,
                          _ completion: @escaping (Result<SessionResponse?, NetworkError>) -> Void) {
        let url = URL(string: "\(API_BASE_URL)/sessions")!
        
        networkClient.performRequest(method: .post,
                                     url: url,
                                     urlParameters: [:],
                                     headers: [:],
                                     body: userData.toData(),
                                     completion: completion)
    }
    
    func updateUserName(name: String, _ completion: @escaping (Result<NoReply?, NetworkError>) -> Void) {
        let url = URL(string: "\(API_BASE_URL)/users")!
        guard let token = SessionDataUserDefaults.getData()?.token else { return }
        let headers: [String: String] = ["Authorization": "Bearer \(token)"]
        
        networkClient.performRequest(method: .put,
                                     url: url,
                                     urlParameters: [:],
                                     headers: headers,
                                     body: UpdateUserNameRequest(name: name).toData(),
                                     completion: completion)
    }
    
    func updateEmail(email: String, _ completion: @escaping (Result<NoReply?, NetworkError>) -> Void) {
        let url = URL(string: "\(API_BASE_URL)/users")!
        guard let token = SessionDataUserDefaults.getData()?.token else { return }
        let headers: [String: String] = ["Authorization": "Bearer \(token)"]
        networkClient.performRequest(method: .put,
                                     url: url,
                                     urlParameters: [:],
                                     headers: headers,
                                     body: UpdateEmailRequest(email: email).toData(),
                                     completion: completion)
    }
}
