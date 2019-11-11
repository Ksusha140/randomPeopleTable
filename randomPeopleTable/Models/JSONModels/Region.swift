//
//  Region.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 11.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

struct Region {
    let id: Int
    let countryId: Int
    let name: String
}

extension Region: Codable { }
