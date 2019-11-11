//
//  Person.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 31.10.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

struct Person {
    let gender: String
    
    let name: String
    let surname: String
    let patronymic: String
    
    let birthdate: Date
    var age: Int {
        let calender = Calendar.current
        let years = calender.dateComponents([.year], from: birthdate, to: Date()).year
        
        return years!
    }
    
    let cityOfBirth: String
    let address: Address
}
