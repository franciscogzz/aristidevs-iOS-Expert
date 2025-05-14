//
//  ListExample.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 13/05/25.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charizard"),
    Pokemon(name: "Squirtle"),
    Pokemon(name: "Bulbasaur"),
    Pokemon(name: "Jigglypuff"),
    Pokemon(name: "Pidgey"),
    Pokemon(name: "Rattata"),
    Pokemon(name: "Spearow"),
    Pokemon(name: "Oddish"),
]

var digimons = [
    Digimon(name: "Togekiss"),
    Digimon(name: "Gengar"),
    Digimon(name: "Snorlax"),
    Digimon(name: "Porygon"),
    Digimon(name: "Weezing"),
    Digimon(name: "Vaporeon"),
    Digimon(name: "Zekrom"),
    Digimon(name: "Zekrom"),
]

struct ListExample: View {
    var body: some View {
        List {
            Section(header: Text("Pokemons")) {
                ForEach(pokemons, id: \.name) { pokemon in
                    Text(pokemon.name)
                }
            }
            Section(header: Text("Digimon")) {
                ForEach(digimons) { digimon in
                    Text(digimon.name)
                }
            }
        }.listStyle(.automatic)
    }
}

struct Pokemon {
    let name: String
}

struct Digimon: Identifiable {
    let id = UUID()
    let name: String
}

#Preview {
    ListExample()
}
