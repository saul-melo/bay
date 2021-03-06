//
//  PlaceList.swift
//  Bay
//
//  Created by Saul Melo on 3/5/21.
//

import SwiftUI

struct PlaceList: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(places) { place in
                    NavigationLink(destination: PlaceDetail(place: place)) {
                        PlaceRow(place: place)
                    }
                }
            }
            .navigationTitle("Places")
        }
    }
}

struct PlaceList_Previews: PreviewProvider {
    static var previews: some View {
        PlaceList()
    }
}
