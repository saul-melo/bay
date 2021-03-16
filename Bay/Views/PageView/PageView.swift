//
//  PageView.swift
//  Bay
//
//  Created by Saul Melo on 3/15/21.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().places.prefix(3).map { FeatureCard(place: $0) })
            .aspectRatio(3/2, contentMode: .fit)
    }
}
