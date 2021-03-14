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
    var seasonalPhoto = Season.spring
    var lastVisited = Date()
    
    static let `default` = Profile(username: "e_holmes")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { self.rawValue }
    }
}
