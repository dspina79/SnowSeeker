//
//  Facility.swift
//  SnowSeeker
//
//  Created by Dave Spina on 2/26/21.
//

import SwiftUI

struct Facility: Identifiable {
    let id = UUID()
    var name: String
    
    var icon: some View {
        let icons = [
            "Accommodation": "house",
            "Beginners": "1.circle",
            "Cross-country" : "map",
            "Eco-friendly": "leaf.arrow.circlepath",
            "Family": "person.3"
        ]
        
        if let iconName = icons[name] {
            let image = Image(systemName: iconName)
                .accessibility(label: Text(name))
                .foregroundColor(.secondary)
            return image
        } else {
            fatalError("Facility icon could not be found for \(name)")
        }
    }

    var alert: Alert {
        let messages = [
            "Accommodation": "This resort has popular on-site accommodations.",
            "Beginners": "This resort has lots of ski schools.",
            "Cross-country" : "This resoort has logs of cross-country routes.",
            "Eco-friendly": "This resort reduces waste and is environmentally conscious.",
            "Family": "This resort is great for families."
        ]
        
        if let message = messages[name] {
            let alert = Alert(title: Text(name), message: Text(message))
            return alert
        } else {
            fatalError("A message could not be found for the facility type: \(name)")
        }
        
    }
}
