//
//  SuperHeroSearcherView.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 14/05/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperHeroSearcherView: View {
    @State var superheroName: String = ""
    @State var wrapper: Api.Wrapper? = nil
    @State var isLoading: Bool = false
    
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
                isLoading = true
                print(superheroName)
                Task {
                    do {
                        wrapper = try await Api().getHerosByName(name: superheroName)
                    } catch {
                        print("ERROR", error)
                    }
                    isLoading = false
                }
            }
            if isLoading {
                ProgressView().tint(.white)
            }
            NavigationStack {
                List(wrapper?.results ?? []) { superhero in
                    ZStack {
                        SuperHeroItem(superhero: superhero)
                        NavigationLink(destination: SuperHeroDetailView(
                            id: superhero.id
                        )) { EmptyView().opacity(0) }
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

struct SuperHeroItem: View {
    let superhero: Api.SuperHero
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            VStack {
                Spacer()
                Text(superhero.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }.frame(height: 200).cornerRadius(16).background(Color.backgroundApp).padding(16)
    }
}


#Preview {
    // SuperHeroItem(superhero: Api.SuperHero(id: "", name: "Iron Man"))
    SuperHeroSearcherView()
}
