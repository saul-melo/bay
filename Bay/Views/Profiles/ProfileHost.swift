//
//  ProfileHost.swift
//  Bay
//
//  Created by Saul Melo on 3/13/21.
//

import SwiftUI

struct ProfileHost: View {
    @State private var storedProfile = Profile.default
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: storedProfile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
