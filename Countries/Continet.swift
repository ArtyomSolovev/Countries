//
//  Continet.swift
//  Countries
//
//  Created by Артем Соловьев on 01.12.2021.
//

import UIKit
import RealmSwift

class Continent: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var fullName: String = ""
    @objc dynamic var color: String = ""
    var arrayOfCountry = List<Country>()
    
    convenience init(name: String, fullName: String, color: String, arrayOfCountry: List<Country>) {
        self.init()
        self.name = name
        self.fullName = fullName
        self.color = color
        self.arrayOfCountry = arrayOfCountry
    }
    
    func saveContinent() {
        let country = Country(name: "Нижний Новгород", yearOfFoundation: 1221)
        let list = List<Country>()
        list.append(country)
        let continent = Continent(name: "Евразия", fullName: "Евразия", color: "#FF0000", arrayOfCountry: list)
        
        StorageManager.saveObject(continent)
    }
}
