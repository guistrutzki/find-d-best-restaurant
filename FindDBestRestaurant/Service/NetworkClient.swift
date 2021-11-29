//
//  NetworkClient.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 28/11/21.
//

import Foundation

struct NetworkClient {
    func performRequest<T: Decodable>(method: HTTPMethod,
                                      url: URL,
                                      urlParameters: [String: String],
                                      headers: [String: String],
                                      completion: @escaping(T?) -> Void) {
        
        // Set Parameters
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = urlParameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        // Create request with parameters
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        // Set headers
        headers.forEach { headerField, value in
            request.setValue(value, forHTTPHeaderField: headerField)
        }
        
        
        let dataTask = URLSession.shared.dataTask(with: request) {data, response, error in
            // Handle error
            if let _ = error {
                completion(nil)
                return
            }
            
            // Handle Success
            if let data = data {
                let jsonDecodable = JSONDecoder()
                do {
                    let repositories = try jsonDecodable.decode(T.self, from: data)
                    completion(repositories)
                } catch {
                    print(error)
                    completion(nil)
                }
            }
        }
        
        dataTask.resume()
    }
}
