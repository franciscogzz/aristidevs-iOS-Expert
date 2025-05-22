//
//  FavPlacesView.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 22/05/25.
//

import SwiftUI
import MapKit

struct FavPlacesView: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 25.4350567,
                longitude: -100.9965763
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    @State var places: [Place] = []
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position).onTapGesture {
                    
                }
            }
        }
    }
}

#Preview {
    FavPlacesView()
}
