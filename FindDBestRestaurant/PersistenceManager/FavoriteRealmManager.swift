//
//  FavoriteRealmManager.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 02/11/21.
//

import RealmSwift

class FavoriteRealmManager {
	
	// MARK: - Variable
	private var favorites: Results<FavoriteRealm>?
	
	let realm: Realm = {
		do {
			let realm = try Realm()
			return realm
		} catch {
			fatalError(error.localizedDescription)
		}
	}()
		
	
	// MARK: - Function
	func loadFavorites() {
		let result = realm.objects(FavoriteRealm.self)
		favorites = result
	}
	
	func add(newFavorite favorite: FavoriteRealm) {
		guard let favorites = self.favorites else { return }
		
		do {
			try realm.write { favorites.realm?.add(favorite) }
		} catch {
			print("==>> Erro na Add - \(error.localizedDescription)")
		}
	}
	
	func delete(_ favorite: FavoriteRealm) {
		guard let favorites = favorites else { return }
		
		do {
			try realm.write {
				realm.delete(favorites.filter("idRestaurant == %@", favorite.idRestaurant))
			}
		} catch {
			print("==>> Erro na Delete - \(error.localizedDescription)")
		}
	}
	
	func getFavorite(_ restaurant: RestaurantListResponse) -> Results<FavoriteRealm>? {
		let result = realm.objects(FavoriteRealm.self).filter("idRestaurant == %@", restaurant.id)
		return result
	}
	
	func getFavorite(index: Int) -> FavoriteRealm? {
		return favorites?[index]
	}
	
	func countFavorites() -> Int {
		return favorites?.count ?? 0
	}
	
}
