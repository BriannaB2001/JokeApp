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
                let r: NSFetchRequest<Entry> = Entry.fetchRequest()
                let f = try stack.context.fetch(r)
                pp = f as! [Entry]
            } catch let error as NSError {
                print("woe grabAllPersons \(error)")
            }
            for p: Entry in pp {
                print(" >> \(p.text)")
            }
        return pp
    }
    
    func entryForText(text: String) -> Entry? {
        let entries = getAllEntries()
        for entry in entries {
            if entry.text == text {
                return entry
            }
        }
        return nil
    }
    
    func deleteEntry(entry: Entry) {
        stack.context.delete(entry)
        stack.saveContext()
    }
    
}
