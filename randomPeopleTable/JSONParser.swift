//
//  JSONParser.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 10.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

class JSONParser {
    
    private init() { }
    
    static func parse<T: Decodable>(jsonModelType: T.Type, fromFile fileName: String) -> T? {
        guard let jsonFileData = FileDataLoader.loadJSONFileData(fileName: fileName) else {
            fatalError("Couldn't load \(fileName).json file")
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try? decoder.decode(jsonModelType, from: jsonFileData)
    }
}
