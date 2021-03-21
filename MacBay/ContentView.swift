//
//  ContentView.swift
//  MacBay
//
//  Created by Saul Melo on 3/20/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlaceList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
