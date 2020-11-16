//
//  PersistenceManager.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/11/20.
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
    
    static func retrieveFavorites(completed: @escaping (Result<[Offer], Error>) -> Void) {
        guard let offersData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Offer].self, from: offersData)
            completed(.success(favorites))
        } catch {
            completed(.failure(error))
        }
    }
    
    static func save(favorites: [Offer]) -> Error? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return nil
        }
    }
    
    static func updateWith(favorite: Offer, actionType: PersistenceActionType, completed: @escaping (Error?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(var favorites):
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completed(nil)
                        return
                    }
                    favorites.append(favorite)
                    
                case .remove:
                    favorites.removeAll { $0.id == favorite.id }
                }
                
                completed(save(favorites: favorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
}
