//
//  PlaceDetail.swift
//  Bay
//
//  Created by Saul Melo on 3/2/21.
//

import SwiftUI

struct PlaceDetail: View {
    var place: Place
    var body: some View {
        ScrollView {
            MapView(coordinate: place.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: place.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.title)
                    .fontWeight(.bold)
                Divider()
                Text(place.description)
            }
            .padding()
        }
        .navigationTitle(place.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(place: places[0])
    }
}
