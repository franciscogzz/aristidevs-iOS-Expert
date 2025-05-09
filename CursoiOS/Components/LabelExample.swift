//
//  LabelExample.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 30/04/25.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("Imagen de Assets", image: "swiftui")
        Label("Imagen del sistema de iconos", systemImage: "figure.walk")
        Label(
            title: { Text("Imagen con configuración") },
            icon: {
                Image("swiftui")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
            }
        )
    }
}

#Preview {
    LabelExample()
}
