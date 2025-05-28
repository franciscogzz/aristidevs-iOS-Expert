//
//  Place.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 22/05/25.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id: UUID = UUID()
    let name: String
    let isFavorite: Bool
    let coordinates: CLLocationCoordinate2D
}
