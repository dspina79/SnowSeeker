//
//  TransparentGroupContainerView.swift
//  SnowSeeker
//
//  Created by Dave Spina on 2/24/21.
//

import SwiftUI

struct UserView: View {
    var firstName: String
    var lastName: String
    var country: String
    var petsNames: String
    
    var body: some View {
        Group {
            Text("\(firstName) \(lastName)")
            Text("\(country)")
            Text("\(petsNames)")
        }
    }
}

struct TransparentGroupContainerView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack {
                    UserView(firstName: "Dave", lastName: "Spina", country: "United States", petsNames: "Dora, Abby")
                }
            } else {
                HStack {
                    UserView(firstName: "Dave", lastName: "Spina", country: "USA", petsNames: "Maverick, Marmie")
                }
            }
        }
    }
}

struct TransparentGroupContainerView_Previews: PreviewProvider {
    static var previews: some View {
        TransparentGroupContainerView()
    }
}
