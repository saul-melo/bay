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
    @State private var filter: FilterCategory = .all
    @State private var selectedPlace: Place?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case museums = "Museums"
        case parks = "Parks"
        case restaurants = "Restaurants"
        case stadiums = "Stadiums"
        case buildings = "Buildings"
        case bridge = "Bridges"
        
        var id: FilterCategory { self }
    }
    
    var filteredPlacesNotVisited: [Place] {
        modelData.places.filter { place in
            (!showNotVisitedOnly || !place.visited) && (filter == .all || filter.rawValue == place.category.rawValue)
        }
        .sorted { $0.name.lowercased() < $1.name.lowercased() }
    }
    
    var title: String {
        let title = filter == .all ? "Places" : filter.rawValue
        return showNotVisitedOnly ? "Unvisited \(title)" : title
    }
    
    var selectedPlaceIndex: Int? {
        modelData.places.firstIndex { $0.id == selectedPlace?.id }
    }
    
    var body: some View {
        NavigationView {
            List(selection: $selectedPlace) {
                ForEach(filteredPlacesNotVisited) { place in
                    NavigationLink(destination: PlaceDetail(place: place)) {
                        PlaceRow(place: place)
                    }
                    .tag(place)
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(InlinePickerStyle())
                        
                        Toggle(isOn: $showNotVisitedOnly) {
                            Label("Unvisited", systemImage: "checkmark.circle")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            Text("Select a Place")
        }
        .focusedValue(\.selectedPlace, $modelData.places[selectedPlaceIndex ?? 0])
    }
}

struct PlaceList_Previews: PreviewProvider {
    static var previews: some View {
        PlaceList()
            .environmentObject(ModelData())
    }
}
