//
//  RandomPersonConstructor.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 10.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

final class RandomPersonConstructor {
    
    private let genders: [Gender]
    private let names: [Name]
    private let surnames: [Surname]
    private let patronymics: [Patronymic]
    private let addressConstructor: RandomAddressConstructor
    
    init(
        genders: [Gender],
        names: [Name],
        surnames: [Surname],
        patronymics: [Patronymic],
        addressConstructor: RandomAddressConstructor
    ) {
        self.genders = genders
        self.names = names
        self.surnames = surnames
        self.patronymics = patronymics
        self.addressConstructor = addressConstructor
    }
    
    func constructRandomPerson() -> Person? {
        guard let gender = genders.randomElement() else {
            return nil
        }
        
        let filteredNames = names.filter { $0.genderId == gender.id }
        guard let name = filteredNames.randomElement()?.name else {
            return nil
        }
        
        let filteredSurnames = surnames.filter { $0.genderId == gender.id }
        guard  let surname = filteredSurnames.randomElement()?.surname else {
            return nil
        }
        
        let filteredPatronymics = patronymics.filter { $0.genderId == gender.id }
        guard  let patronymic = filteredPatronymics.randomElement()?.patronymic else {
            return nil
        }
        
        guard let cityOfBirth = addressConstructor.constructRandomAddress()?.city else {
            return nil
        }
        
        guard let address = addressConstructor.constructRandomAddress() else {
            return nil
        }
        
        let birthdate = RandomBirthdateGenerator.generateBirthdate()
        
        let randomPerson = Person(
            gender: gender.name,
            name: name,
            surname: surname,
            patronymic: patronymic,
            birthdate: birthdate,
            cityOfBirth: cityOfBirth,
            address: address
        )
        
        return randomPerson
    }
}
