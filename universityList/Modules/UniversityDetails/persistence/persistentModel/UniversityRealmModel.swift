//
//  UniversityRealmModel.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import RealmSwift

class UniversityRealmModel: Object {
    @Persisted(primaryKey: true) var id: ObjectId 
    @Persisted var name: String = ""
    @Persisted var country: String = ""
    @Persisted var stateProvince: String?
    @Persisted var alphaTwoCode: String = ""
    @Persisted var webPages: List<String> = List<String>()
    @Persisted var domains: List<String> = List<String>()
}
