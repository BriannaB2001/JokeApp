//
//  CatFacts.swift
//  JokeApp
//
//  Created by Brianna Babcock on 10/21/20.
//

import Foundation

struct CatFact: Codable {
    var text: String
}

struct CatFacts: Codable {
    var all: [CatFact]
}
