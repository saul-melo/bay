//
//  Place.swift
//  Bay
//
//  Created by Saul Melo on 3/3/21.
//

import Foundation

struct Place: Codable {
    var name: String
    var description: String
    var coordinates: Coordinates
    
    struct Coordinates: Codable {
        var latitude: Double
        var longitude: Double
    }
}
