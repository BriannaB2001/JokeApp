//
//  InspirationalQuotes.swift
//  JokeApp
//
//  Created by Talmage Hassell on 12/21/20.
//

import Foundation

struct IQSlip: Codable {
    var iq: String

    enum CodingKeys: String, CodingKey {
        case iq = "quoteText"
    }

    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        iq = try valueContainer.decode(String.self, forKey: .iq)
    }
}


