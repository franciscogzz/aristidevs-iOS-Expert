//
//  SuperHeroSearcherView.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 14/05/25.
//

import SwiftUI

struct SuperHeroSearcherView: View {
    @State var superheroName: String = ""
    
    var body: some View {
        VStack {
            TextField(
                "",
                text: $superheroName,
                prompt: Text("Search a superhero...").font(.title2).bold().foregroundColor(.gray)
            )
            .font(.title2)
            .bold()
            .foregroundColor(.white)
            .padding(16)
            .border(.purple, width: 1)
            .cornerRadius(8)
            .padding(8)
            .autocorrectionDisabled()
            .onSubmit {
                print(superheroName)
                Task {
                    do {
                        let response = try await Api().getHerosByName(name: superheroName)
                        print(response)
                    } catch {
                        print("ERROR")
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

#Preview {
    SuperHeroSearcherView()
}
