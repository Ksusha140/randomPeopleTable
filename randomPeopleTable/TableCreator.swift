//
//  TableFileCreator.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 11.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

class TableFileCreator {
    
    static func createTableFile(withData data: Data?) {
        let fileManager = FileManager.default
        let currentDirectoryPathURL = URL(fileURLWithPath: fileManager.currentDirectoryPath, isDirectory: true)
        let resultsURL = currentDirectoryPathURL.appendingPathComponent("Results", isDirectory: true)
        guard let _ = try? fileManager.createDirectory(at: resultsURL, withIntermediateDirectories: true) else {
            fatalError("Couldn't create directory for result file")
        }
        
        let fileURL = resultsURL.appendingPathComponent("result_\(Date().timeIntervalSince1970).csv", isDirectory: false)
        let filePath = fileURL.path
        
        if fileManager.createFile(atPath: filePath, contents: data) {
            print("File was successfully created. Path to file: \(filePath)")
        } else {
            fatalError("Couldn't create file at path: \(filePath)")
        }
    }
}
