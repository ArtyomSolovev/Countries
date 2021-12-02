//
//  Country.swift
//  Countries
//
//  Created by Артем Соловьев on 29.11.2021.
//

//import Foundation

//struct Country {
//    let name: String
//    let yearOfFoundation: Int
//}
//
//extension Country {
//    static var data: [Self] {
//        let country1 = Country(name: "New York", yearOfFoundation: 1992)
//        let country2 = Country(name: "New York2", yearOfFoundation: 1962)
//        let country3 = Country(name: "New York3", yearOfFoundation: 1942)
//        let country4 = Country(name: "New York5", yearOfFoundation: 1932)
//        let country5 = Country(name: "New York4", yearOfFoundation: 1942)
//        return [country1, country2, country3, country4, country5]
//    }
//}

import RealmSwift
class Country: Object {
    @objc dynamic var name: String?
    @objc dynamic var yearOfFoundation: Int = 0

    convenience init(name: String, yearOfFoundation: Int) {
        self.init()
        self.name = name
        self.yearOfFoundation = yearOfFoundation
    }
    static var data: [Country] {
        let country1 = Country(name: "Санкт-Петербург", yearOfFoundation: 1703)
        let country2 = Country(name: "Москва", yearOfFoundation: 1147)
        let country3 = Country(name: "Новосибирск", yearOfFoundation: 1903)
        let country4 = Country(name: "Екатеринбург", yearOfFoundation: 1781)
        let country5 = Country(name: "Казань", yearOfFoundation: 1005)
        return [country1, country2, country3, country4, country5]
    }

}
