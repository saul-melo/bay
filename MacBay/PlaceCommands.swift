//
//  PlaceCommands.swift
//  Bay
//
//  Created by Saul Melo on 3/20/21.
//

import SwiftUI

struct PlaceCommands: Commands {
    private struct MenuContent: View {
        @FocusedBinding(\.selectedPlace) var selectedPlace
        
        var body: some View {
            Button(selectedPlace?.visited == true ? "Mark as Unvisited" : "Mark as Visited") {
                selectedPlace?.visited.toggle()
            }
            .keyboardShortcut("v", modifiers: [.shift, .option])
            .disabled(selectedPlace == nil)
        }
    }
    
    var body: some Commands {
        SidebarCommands()
        CommandMenu("Place") {
            MenuContent()
        }
    }
}

private struct SelectedPlaceKey: FocusedValueKey {
    typealias Value = Binding<Place>
}

extension FocusedValues {
    var selectedPlace: Binding<Place>? {
        get { self[SelectedPlaceKey.self] }
        set { self[SelectedPlaceKey.self] = newValue }
    }
}
