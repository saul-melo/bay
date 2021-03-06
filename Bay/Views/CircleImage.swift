//
//  CircleImage.swift
//  Bay
//
//  Created by Saul Melo on 3/2/21.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image 
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: places[0].image)
    }
}
