//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by Dave Spina on 2/25/21.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) for bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to get data from \(file).")
        }
        
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode data.")
        }
        
        return decoded
    }
}
