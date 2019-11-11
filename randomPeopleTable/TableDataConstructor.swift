//
//  TableDataConstructor.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 11.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

class TableDataConstructor {
    
    private init() { }
    
    static func constructTableData(for persons: [Person]) -> Data? {
        var tableString = ""
        let tableHeaders = "ИМЯ,ФАМИЛИЯ,ОТЧЕСТВО,ВОЗРАСТ,ПОЛ,ДАТА РОЖДЕНИЯ,МЕСТО РОЖДЕНИЯ,ИНДЕКС,СТРАНА,СУБЪЕКТ,ГОРОД,УЛИЦА,ДОМ,КВАРТИРА\n"
        tableString.append(tableHeaders)
        
        for person in persons {
            let birthdate = BirthdateFormatter.formateBirthdate(person.birthdate)
            let personString = "\(person.name),\(person.surname),\(person.patronymic),\(person.age),\(person.gender),\(birthdate),\(person.cityOfBirth)"
            let address = person.address
            let addressString = "\(address.index),\(address.contry),\(address.region),\(address.city),\(address.street),\(address.house),\(address.flat)"
            
            tableString.append(personString + "," + addressString + "\n")
        }
        
        return tableString.data(using: .utf8)
    }
}
