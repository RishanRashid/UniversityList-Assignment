//
//  PersistenceManager.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import Foundation
import RealmSwift

/// A singleton class that manages the persistence of the universities data.
/// It uses Realm as the persistence store.
class PersistenceManager {
    static let shared = PersistenceManager()
    private let realm: Realm

    private init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm, error: \(error)")
        }
    }

    /// Saves the given array of universities to the Realm database.
    ///
    /// - Parameter universities: The array of universities to be saved.
    func saveUniversities(_ universities: [UniversityRealmModel]) {
        do {
            try realm.write {
                realm.add(universities, update: .modified)
            }
        } catch {
            print("Failed to save universities, error: \(error)")
        }
    }


    /// Fetches the list of universities from the persistence store.
    /// - Returns: An array of `University` objects.
    func fetchUniversities() -> [UniversityRealmModel] {
        let universities = realm.objects(UniversityRealmModel.self)
        return Array(universities)
    }
}
