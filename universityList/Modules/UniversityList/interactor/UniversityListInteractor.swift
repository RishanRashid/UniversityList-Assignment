//
//  UniversityListInteractor.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import Foundation

protocol UniversityListInteractorInput {
    func fetchUniversities()
}

protocol UniversityListInteractorOutput: AnyObject {
    func universitiesFetched(_ universities: [University])
    func universitiesFetchFailed(with error: Error)
}

class UniversityListInteractor: UniversityListInteractorInput {
    weak var presenter: UniversityListInteractorOutput?

    func fetchUniversities() {
        if NetworkManager.shared.isReachable() {
            fetchFromApi()
        } else {
            fetchFromLocal()
        }
    }
    
    private func fetchFromApi() {
        ListService.fetchUniversities { universities, error in
            DispatchQueue.main.async {
                if let universities = universities {
                    self.presenter?.universitiesFetched(universities)
                    PersistenceManager.shared.saveUniversities(universities.map { $0.toRealmModel() })
                } else if let error = error {
                    self.presenter?.universitiesFetchFailed(with: error)
                }
            }
        }
    }
    
    private func fetchFromLocal() {
        let universitiesInRealm = PersistenceManager.shared.fetchUniversities()
        let universities = universitiesInRealm.map { $0.toModel() }
        presenter?.universitiesFetched(universities)
    }
}

