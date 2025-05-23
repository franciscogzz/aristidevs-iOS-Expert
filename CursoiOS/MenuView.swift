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
                List {
                    NavigationLink(destination: IMCView()) {
                        Text("IMC Calculator")
                    }
                    NavigationLink(destination: SuperHeroSearcherView()) {
                        Text("Super Hero Searcher")
                    }
                    NavigationLink(destination: FavPlacesView()) {
                        Text("Favorite Places")
                    }
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
