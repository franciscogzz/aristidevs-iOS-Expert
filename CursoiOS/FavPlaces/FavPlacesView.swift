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
    @State var showPopup: Bool = false
    @State var name: String = ""
    @State var isFavorite: Bool = false
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position).onTapGesture {
                    showPopup = true
                }
            }
            
            if showPopup {
                let view = VStack {
                    Text("Añadir lugar").font(.title2).bold()
                    Spacer()
                    TextField("Nombre del lugar", text: $name).padding(.bottom, 8)
                    Toggle("¿Guardar favorito?", isOn: $isFavorite)
                    Spacer()
                    Button("Guardar") {
                        
                    }
                }
                
                withAnimation {
                    CustomDialogView(
                        closeDialog: {
                            showPopup = false
                        },
                        onDismissOutside: true,
                        content: view
                    )
                }
            }
        }
    }
}

#Preview {
    FavPlacesView()
}
