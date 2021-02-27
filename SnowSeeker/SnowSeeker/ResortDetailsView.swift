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
        // layout priorty indicates that the layout for the
        // item is more important than its parent
        Group {
            Text("Size: \(size)")
                .layoutPriority(1)
            Spacer().frame(height: 0)
            Text("Price: \(priceString)")
                .layoutPriority(1)
        }
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailsView(resort: Resort.example)
    }
}
