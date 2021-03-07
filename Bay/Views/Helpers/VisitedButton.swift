//
//  VisitedButton.swift
//  Bay
//
//  Created by Saul Melo on 3/6/21.
//

import SwiftUI

struct VisitedButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
                isSet.toggle()
        }) {
            Image(systemName: isSet ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isSet ? .orange : .gray)
        }
    }
}

struct VisitedButton_Previews: PreviewProvider {
    static var previews: some View {
        VisitedButton(isSet: .constant(true))
    }
}
