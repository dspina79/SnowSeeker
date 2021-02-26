//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Dave Spina on 2/25/21.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort
    var size: String {
        switch resort.size {
        case 1:
            return "Small"
        case 2:
            return "Average"
        case 3:
            return "Large"
        default:
            return "Unknown"
        }
    }
    
    var priceString: String {
        return String.init(repeating: "$", count: resort.price)
    }
    
    var body: some View {
        VStack {
            Text("Size: \(size)")
            Text("Price: \(priceString)")
        }
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailsView(resort: Resort.example)
    }
}
