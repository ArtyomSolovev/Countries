//
//  StorageManager.swift
//  Countries
//
//  Created by Артем Соловьев on 02.12.2021.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveObject(_ continent: Continent ){
        try! realm.write({
            realm.add(continent)
        })
    }
}
