//
//  MenuView.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 02/05/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: IMCView()) {
                    Text("IMC Calculator")
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
