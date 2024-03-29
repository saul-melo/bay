//
//  ModelData.swift
//  Bay
//
//  Created by Saul Melo on 3/3/21.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var places: [Place] = load("placesData.json")
    @Published var profile = Profile.default
    
    var categories: [String : [Place]] {
        Dictionary(grouping: places) { $0.category.rawValue }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Could not find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
