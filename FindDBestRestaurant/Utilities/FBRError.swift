//
//  FBRError.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 19/09/21.
//

import Foundation

enum FBRError: String, Error {
    
    case unableToFavorite   = "Ocorreu um erro , tente novamente."
    
    case alreadyInFavorites = "Este restaurante já está na sua lista de favoritos!!"
}
