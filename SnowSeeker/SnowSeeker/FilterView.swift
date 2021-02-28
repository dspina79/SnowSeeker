//
//  FilterView.swift
//  SnowSeeker
//
//  Created by Dave Spina on 2/27/21.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var resorts: [Resort]
    @State private var sortOrder: Int = 0
    
    let sortOptions = ["Default", "Alphabetical", "By Country"]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sort Order")
                .font(.headline)
        
            Picker("Sort Order", selection: $sortOrder) {
                ForEach(0..<sortOptions.count) { i in
                    Text("\(sortOptions[i])")
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Button("Done") {
                sortAndFilter()
                self.presentationMode.wrappedValue.dismiss()
            }
        }.padding()
    }
    
    func sortAndFilter() {
        resorts = Resort.allResorts
        
        switch sortOrder {
        case 1:
            resorts.sort {
                $0.name < $1.name
            }
        case 2:
                resorts.sort {
                    $0.country < $1.country
                }
        default:
            resorts.sort {
                $0.id < $1.id
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        let resort1 = Resort(id: "1", name: "Test Resort", country: "USA", description: "My Resorts", price: 2, size: 2, imageCredit: "Doug", snowDepth: 2, elevation: 4, runs: 2, facilities: [])
        let myResorts: [Resort] = [resort1]
        FilterView(resorts: .constant(myResorts))
    }
}
