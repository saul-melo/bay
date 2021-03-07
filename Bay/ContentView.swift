//
//  ContentView.swift
//  Bay
//
//  Created by Saul Melo on 3/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlaceList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
