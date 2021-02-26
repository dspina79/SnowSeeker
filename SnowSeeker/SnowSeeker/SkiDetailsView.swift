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
        VStack {
            Text("Elevation: \(resort.elevation)m")
            Text("Snow Depth: \(resort.snowDepth)cm")
        }
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: Resort.example)
    }
}
