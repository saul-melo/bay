//
//  PlaceSettings.swift
//  MacBay
//
//  Created by Saul Melo on 3/20/21.
//

import SwiftUI

struct PlaceSettings: View {
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        Form {
            Picker("Map Zoom", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(InlinePickerStyle())
        }
        .frame(width: 300)
        .navigationTitle("Place Settings")
        .padding(80)
    }
}

struct PlaceSettings_Previews: PreviewProvider {
    static var previews: some View {
        PlaceSettings()
    }
}
