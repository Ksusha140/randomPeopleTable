//
//  main.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 31.10.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

guard let genders = JSONParser.parse(jsonModelType: [Gender].self, fromFile: "Genders"),
    let names = JSONParser.parse(jsonModelType: [Name].self, fromFile: "Names"),
    let surnames = JSONParser.parse(jsonModelType: [Surname].self, fromFile: "Surnames"),
    let patronymics = JSONParser.parse(jsonModelType: [Patronymic].self, fromFile: "Patronymics"),
    let countries = JSONParser.parse(jsonModelType: [Country].self, fromFile: "Countries"),
    let regions = JSONParser.parse(jsonModelType: [Region].self, fromFile: "Regions"),
    let cities = JSONParser.parse(jsonModelType: [City].self, fromFile: "Cities"),
    let streets = JSONParser.parse(jsonModelType: [Street].self, fromFile: "Streets"),
    let indices = JSONParser.parse(jsonModelType: [Index].self, fromFile: "Indices") else {
        fatalError("Couldn't parse JSON from resource files")
}

let addressConstructor = RandomAddressConstructor(
    countries: countries,
    regions: regions,
    cities: cities,
    streets: streets,
    indices: indices
)

let personConstructor = RandomPersonConstructor(
    genders: genders,
    names: names,
    surnames: surnames,
    patronymics: patronymics,
    addressConstructor: addressConstructor
)

var linesCount: Int!
let linesFromArgc = Int(CommandLine.arguments.last ?? "")
if (1...30).contains(linesFromArgc ?? 0) {
    linesCount = linesFromArgc
} else {
    while(linesCount == nil) {
        print("Write number of lines to generate:")
        let linesCountInput = Int(readLine() ?? "")
        if (1...30).contains(linesCountInput ?? 0) {
            linesCount = linesCountInput
        } else {
            print("Wrong input. Value must be a number from 1 to 30")
        }
    }
}

var randomPersons = [Person]()
(0..<linesCount).forEach { _ in
    guard let person = personConstructor.constructRandomPerson() else {
        fatalError("Couldn't construct person with json-data provided in resources")
    }
    
    randomPersons.append(person)
}

let tableData = TableDataConstructor.constructTableData(for: randomPersons)
TableFileCreator.createTableFile(withData: tableData)
