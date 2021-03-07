//
//  ContentView.swift
//  Bay
//
//  Created by Saul Melo on 3/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .places
    
    enum Tab {
        case categories, places
    }
    
    var body: some View {
        TabView(selection: $selection) {
            PlaceList()
                .tag(Tab.places)
                .tabItem { Label("Places", systemImage: "list.bullet") }
            CategoryHome()
                .tag(Tab.categories)
                .tabItem { Label("Categories", systemImage: "rectangle.3.offgrid.fill") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
