//
//  Gender.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 10.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

struct Gender {
    let id: Int
    let name: String
}

extension Gender: Codable { }
