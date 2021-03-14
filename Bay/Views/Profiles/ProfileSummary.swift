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
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Sesonal photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal date: ") + Text(profile.goalDate, style: .date)
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
