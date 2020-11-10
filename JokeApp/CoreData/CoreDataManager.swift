//
//  CoreDataManager.swift
//  JokeApp
//
//  Created by Brianna Babcock on 11/10/20.
//

import Foundation
import CoreData

enum EntryType: String {
    case dadJoke, catFact, advice, quote
}

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    let stack = CoreDataStack.shared
    
    func createNewEntry(text: String, type: EntryType) {
        guard let entity = NSEntityDescription.entity(forEntityName: "Entry", in: stack.context) else {return}
        
        let newEntry = Entry(entity: entity, insertInto: stack.context)
        
        newEntry.id = UUID().uuidString
        newEntry.creationDate = Date()
        newEntry.text = text
        newEntry.type = type.rawValue
        
    }
}
