//
//  RandomAddressConstructor.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 10.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

final class RandomAddressConstructor {
    
    private let countries: [Country]
    private let regions: [Region]
    private let cities: [City]
    private let streets: [Street]
    private let indices: [Index]
    
    init(
        countries: [Country],
        regions: [Region],
        cities: [City],
        streets: [Street],
        indices: [Index]
    ) {
        self.countries = countries
        self.regions = regions
        self.cities = cities
        self.streets = streets
        self.indices = indices
    }
    
    func constructRandomAddress() -> Address? {
        guard let index = indices.randomElement() else {
            return nil
        }
        
        let filteredStreets = streets.filter { $0.id == index.streetId }
        guard let street = filteredStreets.randomElement() else {
            return nil
        }
        
        let filteredCities = cities.filter { $0.id == street.cityId }
        guard let city = filteredCities.randomElement() else {
            return nil
        }
        
        let filteredRegions = regions.filter { $0.id == city.regionId }
        guard let region = filteredRegions.randomElement() else {
            return nil
        }
        
        let filteredCountries = countries.filter { $0.id == region.countryId }
        guard let country = filteredCountries.randomElement() else {
            return nil
        }
        
        let house = (1...50).randomElement()!
        let flat = (1...250).randomElement()!
        
        let randomAddress = Address(
            index: index.index,
            contry: country.name,
            region: region.name,
            city: city.name,
            street: street.name,
            house: house,
            flat: flat
        )
        
        return randomAddress
    }
}
