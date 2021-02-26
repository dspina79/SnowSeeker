//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Dave Spina on 2/25/21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.largeTitle)
            
            Text("Select a ski resort from the left navigation menu; swiping from the left to reveal.")
                .foregroundColor(.secondary )
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
