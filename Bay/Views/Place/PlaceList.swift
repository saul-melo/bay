//
//  PlaceList.swift
//  Bay
//
//  Created by Saul Melo on 3/5/21.
//

import SwiftUI

struct PlaceList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showNotVisitedOnly = false
    
    var filteredPlacesNotVisited: [Place] {
        modelData.places.filter { place in
            (!showNotVisitedOnly || !place.visited)
        }
        .sorted { $0.name.lowercased() < $1.name.lowercased() }
    }
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Spacer()
                    Text("Unexplored Only")
                        .font(.subheadline)
                    Toggle(isOn: $showNotVisitedOnly, label: {
                        Text("Unvisited Only")
                    }).labelsHidden()
                }
                
                ForEach(filteredPlacesNotVisited) { place in
                    NavigationLink(destination: PlaceDetail(place: place)) {
                        PlaceRow(place: place)
                    }
                }
            }
            .navigationTitle("Places")
        }
    }
}

struct PlaceList_Previews: PreviewProvider {
    static var previews: some View {
        PlaceList()
            .environmentObject(ModelData())
    }
}
