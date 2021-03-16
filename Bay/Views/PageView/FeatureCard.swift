//
//  FeatureCard.swift
//  Bay
//
//  Created by Saul Melo on 3/15/21.
//

import SwiftUI

struct FeatureCard: View {
    var place: Place
    var body: some View {
        place.image
            .resizable()
            .aspectRatio(3/2, contentMode: .fit)
            .overlay(TextOverlay(place: place))
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(place: ModelData().places[6])
    }
}

struct TextOverlay: View {
    var place: Place
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.title)
                    .bold()
                Text(place.description)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}
