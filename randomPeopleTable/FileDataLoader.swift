//
//  FileDataLoader.swift
//  randomPeopleTable
//
//  Created by Ксения Афанасьева on 10.11.2019.
//  Copyright © 2019 Ксения Афанасьева. All rights reserved.
//

import Foundation

class FileDataLoader {
    
    private init() { }
    
    private static var fileManager = FileManager.default
    
    private static func updateCurrentDirectoryPathIfNeeded() {
        guard let appPath = CommandLine.arguments.first else {
            fatalError("Couldn't get current build directory path from arguments")
        }
        
        let appPathURL = URL(fileURLWithPath: appPath)
        let newCurrentDirectoryPath = appPathURL.deletingLastPathComponent().path
        
        fileManager.changeCurrentDirectoryPath(newCurrentDirectoryPath)
    }
    
    static func loadFileData(fileName: String, fileType: String) -> Data? {
        updateCurrentDirectoryPathIfNeeded()
        
        let currentDirectoryURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
        let resourcesURL = currentDirectoryURL.appendingPathComponent("Resources", isDirectory: true)
        let fileURL = resourcesURL.appendingPathComponent(fileName + "." + fileType, isDirectory: false)
        
        return fileManager.contents(atPath: fileURL.path)
    }
    
    static func loadJSONFileData(fileName: String) -> Data? {
        return FileDataLoader.loadFileData(fileName: fileName, fileType: "json")
    }
}
