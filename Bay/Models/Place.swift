//
//  Place.swift
//  Bay
//
//  Created by Saul Melo on 3/3/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Place: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var address: Address?
    var description: String
    var visited: Bool
    var category: Category
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    enum Category: String, CaseIterable, Codable {
        case building = "Buildings"
        case bridge = "Bridges"
        case restaurant = "Restaurants"
        case park = "Parks"
        case museum = "Museums"
        case stadium = "Stadiums"
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    struct Address: Hashable, Codable {
        var street: String
        var city: String
        var zip: Int
    }
}
