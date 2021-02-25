//
//  OptionalSheetAlertView.swift
//  SnowSeeker
//
//  Created by Dave Spina on 2/24/21.
//

import SwiftUI

struct User: Identifiable {
    var id = "George Michael"
}

struct OptionalSheetAlertView: View {
    @State private var selectedUser: User? = nil
    @State private var selectedUser2: User? = nil
    var body: some View {
        VStack {
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                self.selectedUser = User()
            }
            .alert(item: $selectedUser) { user in
                Alert(title: Text("User Found"), message: Text("The user is \(user.id)"), dismissButton: .default(Text("Ok")))
            }
            Rectangle()
                .padding()
                .frame(width: 600, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Hello, Sheet!")
                .onTapGesture {
                    self.selectedUser2 = User()
                }
            .sheet(item: $selectedUser2) { user in
                Text("Hello \(user.id)!")
            }
        }
        // on dismiss, the selctedUser is set back to nil
    }
}

struct OptionalSheetAlertView_Previews: PreviewProvider {
    static var previews: some View {
        OptionalSheetAlertView()
    }
}
