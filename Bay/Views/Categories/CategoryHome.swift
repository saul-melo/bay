//
//  CategoryHome.swift
//  Bay
//
//  Created by Saul Melo on 3/7/21.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                modelData.places[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                    .padding(.bottom, 40)
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { category in
                    CategoryRow(categoryName: category, places: modelData.categories[category]!)
                    Divider()
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
