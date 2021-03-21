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
        let mainWindow = WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        
        #if os(macOS)
        mainWindow
            .commands {
                PlaceCommands()
            }
        #else
        mainWindow
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "PlaceNear")
        #endif
        
        #if os(macOS)
        Settings {
            PlaceSettings()
        }
        #endif
    }
}
