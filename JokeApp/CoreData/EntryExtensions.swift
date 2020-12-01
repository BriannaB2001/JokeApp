//
//  EntryExtensions.swift
//  JokeApp
//
//  Created by Brianna Babcock on 12/1/20.
//

import Foundation

extension Entry {
    var type: EntryType {
        guard let typeString = typeString else { return .advice }
        return EntryType(rawValue: typeString) ?? .advice
    }
}
