//
//  SuperHeroDetailView.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 20/05/25.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperHeroDetailView: View {
    let id: String
    
    @State var superheroDetail: Api.SuperHeroDetail? = nil
    @State var isLoading: Bool = true
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView().tint(.white)
            } else if let superheroDetail = superheroDetail {
                WebImage(url: URL(string: superheroDetail.image.url))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipped()
                Text(superheroDetail.name).bold().font(.title).foregroundColor(.white)
                ForEach(superheroDetail.biography.aliases, id: \.self) { alias in
                    Text(alias).foregroundColor(.gray).italic()
                }
                SuperHeroStatsView(stats: superheroDetail.powerstats)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
        .onAppear() {
            Task {
                do {
                    superheroDetail = try await Api().getHeroById(id: id)
                } catch let error as URLError {
                    switch error.code {
                    case .timedOut:
                        print("⏳ La solicitud tardó demasiado.")
                    case .notConnectedToInternet:
                        print("📴 No estás conectado a Internet.")
                    default:
                        print("❗️ Otro error de red: \(error.localizedDescription)")
                    }
                } catch {
                    superheroDetail = nil
                    print(error)
                }
                isLoading = false
            }
        }
    }
}

struct SuperHeroStatsView: View {
    let stats: Api.Powerstats
    
    var body: some View {
        VStack {
            Chart {
                SectorMark(angle: .value("count", Int(stats.combat) ?? 0), innerRadius: .ratio(0.6), angularInset: 2)
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Combat"))
                SectorMark(angle: .value("count", Int(stats.durability) ?? 0), innerRadius: .ratio(0.6), angularInset: 2)
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Durability"))
                SectorMark(angle: .value("count", Int(stats.intelligence) ?? 0), innerRadius: .ratio(0.6), angularInset: 2)
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Intelligence"))
                SectorMark(angle: .value("count", Int(stats.power) ?? 0), innerRadius: .ratio(0.6), angularInset: 2)
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Power"))
                SectorMark(angle: .value("count", Int(stats.speed) ?? 0), innerRadius: .ratio(0.6), angularInset: 2)
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Speed"))
                SectorMark(angle: .value("count", Int(stats.strength) ?? 0), innerRadius: .ratio(0.6), angularInset: 2)
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Strength"))
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: 350)
        .background(.white)
        .cornerRadius(16)
        .padding(24)
    }
}

#Preview {
    SuperHeroDetailView(id: "7")
}
