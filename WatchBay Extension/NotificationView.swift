//
//  NotificationView.swift
//  WatchBay Extension
//
//  Created by Saul Melo on 3/19/21.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var place: Place?
    
    var body: some View {
        VStack {
            if place != nil {
                CircleImage(image: place!.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "Unkown place")
                .font(.headline)
            
            Text(message ?? "You are within 1 mile of a Bay place")
                .font(.caption)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
        NotificationView(title: "Ferry Building", message: "You are within 1 mile of the Ferry Building", place: ModelData().places[0])
    }
}
