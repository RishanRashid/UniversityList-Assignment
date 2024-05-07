//
//  University.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import Foundation

struct University: Codable {
    let name: String
    let country: String
    let stateProvince: String?
    let domains: [String]
    let webPages: [String]
    let alphaTwoCode: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case country
        case stateProvince = "state-province"
        case domains
        case webPages = "web_pages"
        case alphaTwoCode = "alpha_two_code"
    }
    
    init(name: String, country: String, stateProvince: String?, domains: [String], webPages: [String], alphaTwoCode: String) {
        self.name = name
        self.country = country
        self.stateProvince = stateProvince
        self.domains = domains
        self.webPages = webPages
        self.alphaTwoCode = alphaTwoCode
    }
}

