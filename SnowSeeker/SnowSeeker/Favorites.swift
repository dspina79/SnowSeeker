//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Dave Spina on 2/26/21.
//

import SwiftUI

class Favorites: ObservableObject, Codable {
    private var resorts: Set<String>
    private let SAVE_KEY = "Favorites"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: SAVE_KEY) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                self.resorts = decoded
                return
            } else {
                print("Error attempting to decode data")
            }
        }
        self.resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        return resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        if self.contains(resort) {
            objectWillChange.send()
            self.resorts.remove(resort.id)
            save()
        }
        
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(self.resorts) {
            UserDefaults.standard.setValue(encodedData, forKey: SAVE_KEY)
        } else {
            print("Error encoding data")
        }
        
    }
}
 
