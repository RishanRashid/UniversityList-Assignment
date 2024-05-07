//
//  Mappings.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import Foundation
import RealmSwift

extension UniversityRealmModel {
    /// Converts realm object to `University` object.
    func toModel() -> University {
        return University(
            name: name,
            country: country,
            stateProvince: stateProvince,
            domains: Array(domains),
            webPages: Array(webPages),
            alphaTwoCode: alphaTwoCode
        )
    }
}

extension University {
    /// Converts `University` object to a realm object.
    func toRealmModel() -> UniversityRealmModel {
        let university = UniversityRealmModel()
        university.name = name
        university.country = country
        university.webPages.append(objectsIn: webPages)
        university.domains.append(objectsIn: domains)
        university.alphaTwoCode = alphaTwoCode
        return university
    }
}
