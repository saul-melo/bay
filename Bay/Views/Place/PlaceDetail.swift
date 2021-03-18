//
//  PlaceDetail.swift
//  Bay
//
//  Created by Saul Melo on 3/2/21.
//

import SwiftUI

struct PlaceDetail: View {
    @EnvironmentObject var modelData: ModelData
    var place: Place
    
    var placeIndex: Int {
        modelData.places.firstIndex { $0.id == place.id }!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: place.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: place.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(place.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    VisitedButton(isSet: $modelData.places[placeIndex].visited)
                }
                if (place.address != nil) {
                    VStack(alignment: .leading) {
                        Text(place.address!.street)
                        Text(place.address!.city)
                        Text(String(place.address!.zip))
                    }
                    .font(.caption)
                }
                Divider()
                Text(place.description)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
        }
        .navigationTitle(place.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(place: ModelData().places[5])
            .environmentObject(ModelData())
    }
}
