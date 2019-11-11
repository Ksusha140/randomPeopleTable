//
//  Street.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 11.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

struct Street {
    let id: Int
    let cityId: Int
    let name: String
}

extension Street: Codable { }
