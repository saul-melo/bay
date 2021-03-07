//
//  Place.swift
//  Bay
//
//  Created by Saul Melo on 3/3/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Place: Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var visited: Bool
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Codable {
        var latitude: Double
        var longitude: Double
    }
}
