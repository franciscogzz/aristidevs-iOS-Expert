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
    @State var placeCoordinates: CLLocationCoordinate2D? = nil
    @State var name: String = ""
    @State var isFavorite: Bool = false
    @State var showSheet: Bool = false
    
    let sheetHeight = stride(from: 0.3, through: 0.3, by: 0.1).map {
        PresentationDetent.fraction($0)
    }
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position) {
                    ForEach(places) { place in
                        Annotation(place.name, coordinate: place.coordinates) {
                            let color = place.isFavorite ? Color.yellow : Color.black
                            Circle().stroke(color, lineWidth: 3).fill(.white).frame(width: 35, height: 35)
                        }
                    }
                }.onTapGesture { coords in
                    if let coordinates = proxy.convert(coords, from: .local) {
                        placeCoordinates = coordinates
                    }
                }.overlay {
                    VStack {
                        Button("Show list") {
                            showSheet = true
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(.white)
                        .cornerRadius(12)
                        .padding(12)
                        Spacer()
                    }
                }
            }
            
            if placeCoordinates != nil {
                let view = VStack {
                    Text("Añadir lugar").font(.title2).bold()
                    Spacer()
                    TextField("Nombre del lugar", text: $name).padding(.bottom, 8)
                    Toggle("¿Guardar favorito?", isOn: $isFavorite)
                    Spacer()
                    Button("Guardar") {
                        onSavePlace(name: name, isFav: isFavorite, coordinates: placeCoordinates!)
                        clearForm()
                    }.disabled(name.isEmpty)
                }
                
                withAnimation {
                    CustomDialogView(
                        closeDialog: {
                            placeCoordinates = nil
                        },
                        onDismissOutside: true,
                        content: view
                    )
                }
            }
        }.sheet(isPresented: $showSheet, content: {
            ZStack {
                Text("Bottom sheet")
            }.presentationDetents(Set(sheetHeight))
        })
    }
    
    func onSavePlace(name: String, isFav: Bool, coordinates: CLLocationCoordinate2D) {
        let place = Place(name: name, isFavorite: isFav, coordinates: coordinates)
        places.append(place)
    }
    
    func clearForm() {
        name = ""
        isFavorite = false
        placeCoordinates = nil
    }
}

#Preview {
    FavPlacesView()
}
