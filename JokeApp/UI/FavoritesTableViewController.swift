//
//  FavoritesTableViewController.swift
//  JokeApp
//
//  Created by Brianna Babcock on 11/9/20.
//

import UIKit
import CoreData

class FavoritesTableViewController: UITableViewController {
    
    fileprivate lazy var controller: NSFetchedResultsController<Entry> = {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        // Create Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.shared.context, sectionNameKeyPath: nil, cacheName: nil)
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        return fetchedResultsController
    }()
    
    let context = CoreDataStack.shared.context
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try controller.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return currentTypes.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries(section: section).count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedAdviceCell", for: indexPath)
        let entry = entries(section: indexPath.section)[indexPath.row]
        cell.textLabel?.text = entry.text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt
    indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = entries(section: indexPath.section)[indexPath.row]
            CoreDataManager.shared.deleteEntry(entry: entry)
            try? controller.performFetch()

        }
    }
    
    var currentTypes: [EntryType] {
        let entries = controller.fetchedObjects ?? []
        let allTypes = entries.compactMap { $0.type }
        let uniqueTypes = Array(Set(allTypes))
        return uniqueTypes.sorted(by: {$0.rawValue < $1.rawValue})
    }
    
    func type(for section: Int) -> EntryType {
        return currentTypes[section]
    }
    
    func entries(section: Int) -> [Entry] {
        let type = self.type(for: section)
        let entries = controller.fetchedObjects ?? []
        let entriesOfType = entries.filter { $0.type == type }
        return entriesOfType
    }
    
}

extension FavoritesTableViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChangeContentWith snapshot: NSDiffableDataSourceSnapshotReference) {
        tableView.reloadData()
    }
}
