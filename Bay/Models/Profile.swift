//
//  Profile.swift
//  Bay
//
//  Created by Saul Melo on 3/13/21.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = false
    var bayResidentSince = Date()
    
    static let `default` = Profile(username: "bay_user")
}
