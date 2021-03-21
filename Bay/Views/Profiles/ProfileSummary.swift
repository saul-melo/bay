//
//  ProfileSummary.swift
//  Bay
//
//  Created by Saul Melo on 3/13/21.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    var body: some View {
        List {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Divider()
                HStack {
                    Text("Notifications: ")
                    Spacer()
                    Text(profile.prefersNotifications ? "ON" : "OFF")
                }
                Divider()
                HStack {
                    Text("Bay resident since: ")
                    Spacer()
                    Text(profile.bayResidentSince, style: .date)
                }
            }
            .font(.headline)
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
