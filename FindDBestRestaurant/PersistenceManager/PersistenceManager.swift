//
//  PersistenceManager.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 19/09/21.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: RestaurantListResponse, actionType:PersistenceActionType, completion: @escaping (FBRError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(var favorites):
                var retrieveFavorites = favorites
                switch actionType {
                case .add:
                    guard !retrieveFavorites.contains(favorite) else {
                        completion(.alreadyInFavorites)
                        return
                    }
                    retrieveFavorites.append(favorite)
                   
                case .remove:
                    retrieveFavorites.removeAll { $0.name == favorite.name }
                }
                
                completion(saveFavorites(favorites: favorites))
                
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    ///Usando RestaurantList pq o Restaurant usa UIImage e isso nao é decodable
    ///O UserDefaults quando salva um custom object faz encoding e decondig e salva o objeto como Data
    
    static func retrieveFavorites(completion: @escaping (Result<[ RestaurantListResponse],FBRError>)-> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completion(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favoritesList = try decoder.decode([ RestaurantListResponse].self, from: favoritesData)
            completion(.success(favoritesList))
        } catch {
            completion(.failure(.unableToFavorite))
        }
    }
    
    static func saveFavorites(favorites: [ RestaurantListResponse]) -> FBRError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
        
    }
}
