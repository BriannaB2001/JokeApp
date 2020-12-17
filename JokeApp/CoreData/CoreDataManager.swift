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
        newEntry.typeString = type.rawValue
     
        stack.saveContext()
    }
    
    func getAllEntries() -> [Entry] {
        var pp: [Entry] = []
            do {
                let r = NSFetchRequest<NSFetchRequestResult>(entityName: "Entry")
                let f = try stack.context.fetch(r)
                pp = f as! [Entry]
            } catch let error as NSError {
                print("woe grabAllPersons \(error)")
            }
            for p: Entry in pp {
                print(" >> \(p.text)")
            }
        return []
    }
    
    func entryForText(text: String) -> Entry? {
        // take text and check if entry exists with that text
        // delete entry
        return nil
    }
    
}
