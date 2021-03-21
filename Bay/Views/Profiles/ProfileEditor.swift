//
//  ProfileEditor.swift
//  Bay
//
//  Created by Saul Melo on 3/14/21.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -100, to: profile.bayResidentSince)!
        let max = Date()
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Notifications")
                    .bold()
            }
            
            DatePicker(selection: $profile.bayResidentSince, in: dateRange, displayedComponents: .date) {
                Text("Bay resident since").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
