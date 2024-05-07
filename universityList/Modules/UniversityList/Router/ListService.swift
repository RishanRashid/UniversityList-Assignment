//
//  ListService.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import Foundation

/// A service class to fetch the universities list module related data from API.
class ListService {
    /// Fetches the list of universities from the API.
    static func fetchUniversities(completion: @escaping ([University]?, Error?) -> Void) {
        guard let url = URL(string: "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates") else {
            completion(nil, NetworkError.invalidURL)
            return
        }

        NetworkManager.shared.sendRequest(url: url) { (universities: [University]?, error) in
            completion(universities, error)
        }
    }
}
