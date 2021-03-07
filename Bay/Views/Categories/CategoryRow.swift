//
//  CategoryRow.swift
//  Bay
//
//  Created by Saul Melo on 3/7/21.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var places: [Place]
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(places) { place in
                        NavigationLink(
                            destination: PlaceDetail(place: place),
                            label: {
                                CategoryItem(place: place)
                        })
                    }
                }
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var modelData = ModelData()
    static var previews: some View {
        CategoryRow(categoryName: modelData.categories.keys.sorted()[0], places: modelData.categories[modelData.categories.keys.sorted()[0]]!)
    }
}
