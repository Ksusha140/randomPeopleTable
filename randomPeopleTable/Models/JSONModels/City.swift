//
//  City.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 11.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

struct City {
    let id: Int
    let regionId: Int
    let name: String
}

extension City: Codable { }
