//
//  Surname.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 10.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

struct Surname {
    let genderId: Int
    let surname: String
}

extension Surname: Codable { }
