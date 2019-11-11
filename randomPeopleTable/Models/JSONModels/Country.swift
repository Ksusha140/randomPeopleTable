//
//  Country.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 11.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

struct Country {
    let id: Int
    let name: String
}

extension Country: Codable { }
