//
//  LifeAdvice.swift
//  JokeApp
//
//  Created by Brianna Babcock on 10/28/20.
//

import Foundation

struct AdviceSlip: Codable {
    var advice: Advice
    
    enum CodingKeys: String, CodingKey {
        case advice = "slip"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        advice = try valueContainer.decode(Advice.self, forKey: .advice)
    }
}

struct Advice: Codable {
    var text: String
    
    enum CodingKeys: String, CodingKey {
        case text = "advice"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        text = try valueContainer.decode(String.self, forKey: .text)
    }
}

/*
{
    "slip": {
      "slip_id": "2",
       "advice": "Smile and the world smiles with you. Frown and you're on your own."
    }
  }
*/
