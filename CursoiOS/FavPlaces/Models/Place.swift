//
//  Place.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 22/05/25.
//

import Foundation
import MapKit

struct Place: Identifiable, Codable {
    let id: UUID = UUID()
    let name: String
    let isFavorite: Bool
    let coordinates: CLLocationCoordinate2D
    
    enum CodingKeys: CodingKey {
        case id, name, isFavorite, latitude, longitude
    }
    
    init(name: String, isFavorite: Bool, coordinates: CLLocationCoordinate2D) {
        self.name = name
        self.isFavorite = isFavorite
        self.coordinates = coordinates
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        
        coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(coordinates.latitude, forKey: .latitude)
        try container.encode(coordinates.longitude, forKey: .longitude)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(isFavorite, forKey: .isFavorite)
    }
}
