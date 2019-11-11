//
//  BirthdateFormatter.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 11.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

enum BirthdateFormatter {
    
    static func formateBirthdate(_ birthdate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        return dateFormatter.string(from: birthdate)
    }
}
