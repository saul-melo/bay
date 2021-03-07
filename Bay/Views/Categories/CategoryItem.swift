//
//  CategoryItem.swift
//  Bay
//
//  Created by Saul Melo on 3/7/21.
//

import SwiftUI

struct CategoryItem: View {
    var place: Place
    var body: some View {
        VStack(alignment: .leading) {
            place.image
                .renderingMode(.original)
                .resizable()
                .cornerRadius(5)
            Text(place.name)
                .foregroundColor(.primary)
                .font(.caption)
                
        }
        .frame(width: 200, height: 200)
        .padding(.trailing, 10)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(place: ModelData().places[2])
    }
}
