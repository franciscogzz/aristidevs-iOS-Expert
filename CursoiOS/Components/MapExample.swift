//
//  MapExample.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 21/05/25.
//

import MapKit
import SwiftUI

struct MapExample: View {

    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 25.4350567,
                longitude: -100.9965763
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )

    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position) {
//                    Marker("Grupo DECA", coordinate: CLLocationCoordinate2D(
//                        latitude: 25.4350567,
//                        longitude: -100.9965763
//                    ))
                    Annotation("Grupo DECA", coordinate: CLLocationCoordinate2D(
                        latitude: 25.4350567,
                        longitude: -100.9965763
                    )) {
                        Circle().frame(height: 20)
                    }.annotationTitles(.hidden)
                }
                .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
                //.onMapCameraChange {context in
                //    print("Estamos en: \(context.region)")
                //}
                .onMapCameraChange(frequency: .continuous) { context in
                    print("Estamos en: \(context.region)")
                }
                .onTapGesture { coord in
                    if let coordinates = proxy.convert(coord, from: .local) {
                        withAnimation {
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(
                                        latitude: coordinates.latitude,
                                        longitude: coordinates.longitude
                                    ),
                                    span: MKCoordinateSpan(
                                        latitudeDelta: 0.1,
                                        longitudeDelta: 0.1
                                    )
                                )
                            )
                        }
                    }
                }
            }
            VStack {
                Spacer()
                HStack {
                    Button("Sur") {
                        withAnimation {
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(
                                        latitude: 25.4074192,
                                        longitude: -101.0061785
                                    ),
                                    span: MKCoordinateSpan(
                                        latitudeDelta: 0.1,
                                        longitudeDelta: 0.1
                                    )
                                )
                            )
                        }
                    }.padding(16).background(.white).padding()
                    Button("Norte") {
                        withAnimation {
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(
                                        latitude: 25.4828976,
                                        longitude: -100.9706645
                                    ),
                                    span: MKCoordinateSpan(
                                        latitudeDelta: 0.1,
                                        longitudeDelta: 0.1
                                    )
                                )
                            )
                        }
                    }.padding(16).background(.white).padding()
                }
            }
        }
    }
}

#Preview {
    MapExample()
}
