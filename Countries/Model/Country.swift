//
//  Country.swift
//  Countries
//
//  Created by Артем Соловьев on 29.11.2021.
//

import RealmSwift

final class Country: Object {
    
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
        let country6 = Country(name: "Нижний Новгород", yearOfFoundation: 1221)
        let country7 = Country(name: "Челябинск", yearOfFoundation: 1781)
        let country8 = Country(name: "Самара", yearOfFoundation: 1688)
        let country9 = Country(name: "Омск", yearOfFoundation: 1782)
        let country10 = Country(name: "Ростов-на-Дону", yearOfFoundation: 1807)
        return [country1, country2, country3, country4, country5, country6, country7, country8, country9, country10]
    }

}
