//
//  PlaceRow.swift
//  Bay
//
//  Created by Saul Melo on 3/5/21.
//

import SwiftUI

struct PlaceRow: View {
    var place: Place
    var body: some View {
        HStack {
            place.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(place.name)
        }
    }
}

struct PlaceRow_Previews: PreviewProvider {
    static var previews: some View {
        PlaceRow(place: places[0])
    }
}
