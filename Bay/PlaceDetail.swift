//
//  PlaceDetail.swift
//  Bay
//
//  Created by Saul Melo on 3/2/21.
//

import SwiftUI

struct PlaceDetail: View {
    var body: some View {
        VStack(alignment: .leading) {
            MapView()
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Ferry Buidling")
                    .font(.title)
                    .fontWeight(.bold)
                Divider()
                Text("About the Ferry Building")
            }
            .padding()
            Spacer()
        }
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail()
    }
}
