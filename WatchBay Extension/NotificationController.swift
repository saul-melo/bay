//
//  NotificationController.swift
//  WatchBay Extension
//
//  Created by Saul Melo on 3/19/21.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var title: String?
    var message: String?
    var place: Place?
    
    let placeIndexKey = "placeIndex"

    override var body: NotificationView {
        return NotificationView(title: title, message: message, place: place)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        let modelData = ModelData()
        
        let notificationData = notification.request.content.userInfo as? [String:Any]
        
        let aps = notificationData?["aps"] as? [String:Any]
        let alert = aps?["alert"] as? [String:Any]
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String
        
        if let index = notificationData?[placeIndexKey] as? Int {
            place = modelData.places[index]
        }
    }
}
