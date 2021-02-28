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
    @State private var selectedCountry: String = ""
    @State private var selectedPrice: Int = 3
    @State private var selectedSize: Int = 3
    
    
    let sortOptions = ["Default", "Alphabetical", "By Country"]
    let sizeOptions = ["Small", "Average", "Large"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sort Order")
                .font(.headline)
        
            Picker("Sort Order", selection: $sortOrder) {
                ForEach(0..<sortOptions.count) { i in
                    Text("\(sortOptions[i])")
                }.pickerStyle(SegmentedPickerStyle())
            }
            Text("Filters")
                .font(.headline)
            
            Text("Size")
                .font(.subheadline)
            Picker("Size", selection: $selectedSize) {
                ForEach(1..<sizeOptions.count + 1) { i in
                    Text("\(sizeOptions[i - 1])")
                }
            }
            
            Text("Price")
                .font(.subheadline)
            Picker("Price", selection: $selectedPrice) {
                ForEach(1..<4) {i in
                    Text("\(String.init(repeating: "$", count: i))")
                }
            }
            
            Text("Country")
                .font(.subheadline)
            TextField("Country", text: $selectedCountry)
            
            HStack {
                Button("Apply Filters") {
                    sortAndFilter()
                    self.presentationMode.wrappedValue.dismiss()
                }.padding()
                .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                
                Button("Removve Filters") {
                    clearFilters()
                    self.presentationMode.wrappedValue.dismiss()
                }.padding()
                .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }.padding()
    }
    
    func clearFilters() {
        resorts = Resort.allResorts
        presentationMode.wrappedValue.dismiss()
    }
    
    func sortAndFilter() {
        resorts = Resort.allResorts
        if selectedCountry.trimmingCharacters(in: .whitespaces) != "" {
            resorts = resorts.filter({$0.country.uppercased() == selectedCountry.uppercased()})
        }
        
        resorts = resorts.filter({$0.price <= self.selectedPrice + 1})
        resorts = resorts.filter({$0.size <= self.selectedSize + 1})
        
        // sorting
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
