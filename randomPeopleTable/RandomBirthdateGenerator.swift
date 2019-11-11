//
//  RandomBirthdateGenerator.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 11.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

enum RandomBirthdateGenerator {
    
    static func generateBirthdate() -> Date {
        let calendar = Calendar.current
        let maxYearsFromNow = DateComponents(calendar: calendar, year: -110)
        let maxBirthdate = calendar.date(byAdding: maxYearsFromNow, to: Date())!
        
        let randomTimeInterval = (Int(maxBirthdate.timeIntervalSinceNow)...0).randomElement()!
        
        return Date(timeInterval: TimeInterval(randomTimeInterval), since: Date())
    }
}
