//
//  Api.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 14/05/25.
//

import Foundation

class Api {
    
    struct Wrapper: Codable {
        let response: String
        let results: [SuperHero]
    }
    
    struct SuperHero: Codable, Identifiable {
        let id: String
        let name: String
    }
    
    func getHerosByName(name: String) async throws -> Wrapper {
        let url = URL(string: "https://superheroapi.com/api/58ddf2f61dd01838b6c31afb4b8c28c1/search/\(name)")
        let (data, _) = try await URLSession.shared.data(from: url!)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        return wrapper
    }
    
}
