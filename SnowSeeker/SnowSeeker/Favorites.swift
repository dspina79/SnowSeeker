//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Dave Spina on 2/26/21.
//

import SwiftUI

class Favorites: ObservableObject {
    private var resorts: Set<String>
    private let SAVE_KEY = "Favorites"
    
    init() {
        // load data here
        
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
        // save data
    }
}
 
