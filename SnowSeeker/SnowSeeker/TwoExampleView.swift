//
//  TwoExampleView.swift
//  SnowSeeker
//
//  Created by Dave Spina on 2/24/21.
//

import SwiftUI

struct TwoExampleView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("New Secondary")) {
                Text("Primary View Contents")
            }
            .navigationBarTitle("Primary View")
            
            Text("Secondary")
        }
    }
}

struct TwoExampleView_Previews: PreviewProvider {
    static var previews: some View {
        TwoExampleView()
    }
}
