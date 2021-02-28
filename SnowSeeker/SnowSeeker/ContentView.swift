//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Dave Spina on 2/24/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var favorites = Favorites()
    @State private var sort: String = "Default"
    @State private var showFilters: Bool = false
    
    @State private var resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    var body: some View {
        NavigationView {
            
            List(resorts) { resort in
                NavigationLink(
                    destination: ResortView(resort: resort)) {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 20)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                    
                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                            .layoutPriority(1)
                        
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                }
                if self.favorites.contains(resort) {
                    Spacer()
                    Image(systemName: "heart.fill")
                        .accessibilityLabel(Text("This is a favorite resort."))
                        .foregroundColor(.red)
                }
            }
            .navigationBarTitle("Resorts")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Sort & Filter") {
                        self.showFilters = true
                    }
                }
            })

            WelcomeView()
        }
        .sheet(isPresented: $showFilters) {
            FilterView(resorts: $resorts)
        }
        .environmentObject(favorites)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
