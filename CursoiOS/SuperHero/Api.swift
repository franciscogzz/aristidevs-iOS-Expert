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
        let image: ImageSuperHero
    }
    
    struct ImageSuperHero: Codable {
        let url: String
    }
    
    struct SuperHeroDetail: Codable {
        let id: String
        let name: String
        let image: ImageSuperHero
        let powerstats: Powerstats
        let biography: Biography
    }
    
    struct Powerstats: Codable {
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct Biography: Codable {
        let publisher: String
        let alignment: String
        let aliases: [String]
        let fullName: String
        
        enum CodingKeys: String, CodingKey {
            case publisher = "publisher"
            case alignment = "alignment"
            case aliases = "aliases"
            case fullName = "full-name"
        }
    }
    
    func getHerosByName(name: String) async throws -> Wrapper {
        let url = URL(string: "https://superheroapi.com/api/58ddf2f61dd01838b6c31afb4b8c28c1/search/\(name)")
        let (data, _) = try await URLSession.shared.data(from: url!)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        return wrapper
    }
    
    func getHeroById(id: String) async throws -> SuperHeroDetail {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30 // segundos
        config.timeoutIntervalForResource = 60 // segundos
        let session = URLSession(configuration: config)
        let url = URL(string: "https://superheroapi.com/api/58ddf2f61dd01838b6c31afb4b8c28c1/\(id)")
        let (data, _) = try await session.data(from: url!)
        return try JSONDecoder().decode(SuperHeroDetail.self, from: data)
    }
    
}
