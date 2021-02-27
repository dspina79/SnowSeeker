//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Dave Spina on 2/25/21.
//

import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort
    var body: some View {
        // using group allows it to conform to its parent
        Group {
            Text("Elevation: \(resort.elevation)m")
                .layoutPriority(1)
            Spacer().frame(height: 0)
            Text("Snow Depth: \(resort.snowDepth)cm")
                .layoutPriority(1)
        }
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: Resort.example)
    }
}
