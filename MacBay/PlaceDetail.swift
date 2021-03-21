//
//  PlaceDetail.swift
//  Bay
//
//  Created by Saul Melo on 3/2/21.
//

import SwiftUI
import MapKit

struct PlaceDetail: View {
    @EnvironmentObject var modelData: ModelData
    var place: Place
    
    var placeIndex: Int {
        modelData.places.firstIndex { $0.id == place.id }!
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(coordinate: place.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: place.locationCoordinate))
                    destination.name = place.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImage(image: place.image.resizable())
                        .frame(width: 160, height: 160)
                
                    VStack(alignment: .leading) {
                        HStack {
                            Text(place.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            VisitedButton(isSet: $modelData.places[placeIndex].visited)
                                .buttonStyle(PlainButtonStyle())
                        }
                        if (place.address != nil) {
                            VStack(alignment: .leading) {
                                Text(place.address!.street)
                                Text(place.address!.city)
                                Text(String(place.address!.zip))
                            }
                            .font(.caption)
                        }
                    }
                }
                
                Divider()
                Text(place.description)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(place.name)
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(place: ModelData().places[5])
            .environmentObject(ModelData())
            .frame(width: 850, height: 700)
    }
}
