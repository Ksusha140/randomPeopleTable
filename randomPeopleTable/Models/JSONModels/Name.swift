//
//  Name.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 10.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

struct Name {
    let genderId: Int
    let name: String
}

extension Name: Codable { }
