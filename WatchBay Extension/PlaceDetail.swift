//
//  PlaceDetail.swift
//  WatchBay Extension
//
//  Created by Saul Melo on 3/19/21.
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
            VStack {
                CircleImage(image: place.image)
                    .scaledToFill()
                
                Text(place.name)
                    .font(.headline)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                if (place.address != nil) {
                    Divider()
                    HStack {
                        VStack(alignment: .leading) {
                            Text(place.address!.street)
                            Text(place.address!.city)
                            Text(String(place.address!.zip))
                        }
                        .font(.caption2)
                        Spacer()
                    }
                }
                
                Divider()
                
                Toggle(isOn: $modelData.places[placeIndex].visited) {
                    Text("Visited")
                }
                
                Divider()
                
                Text(place.description)
                    .font(.caption)
                    .bold()
                
                Divider()
                
                MapView(coordinate: place.locationCoordinate)
                    .scaledToFit()
            }
            .padding()
        }
        .navigationTitle("Places")
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        Group {
            PlaceDetail(place: modelData.places[2])
                .environmentObject(ModelData())
                .previewDevice("Apple Watch Series 6 - 44mm")
            
            PlaceDetail(place: modelData.places[8])
                .environmentObject(ModelData())
                .previewDevice("Apple Watch Series 6 - 40mm")
        }
    }
}
