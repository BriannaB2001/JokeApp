//
//  DadJokes.swift
//  JokeApp
//
//  Created by Talmage Hassell on 12/21/20.
//


import Foundation

struct DadJokeSlip: Codable {
    var dadJoke: String

    enum CodingKeys: String, CodingKey {
        case dadJoke = "joke"
    }

    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        dadJoke = try valueContainer.decode(String.self, forKey: .dadJoke)
    }
}

//struct DadJoke: Codable {
//    var text: String
//
//    enum CodingKeys: String, CodingKey {
//        case text = "joke"
//    }
//
//    init(from decoder: Decoder) throws {
//        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
//        text = try valueContainer.decode(String.self, forKey: .text)
//    }
//}
