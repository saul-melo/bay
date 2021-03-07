//
//  BayApp.swift
//  Bay
//
//  Created by Saul Melo on 3/1/21.
//

import SwiftUI

@main
struct BayApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
