//
//  FavoritesTableViewController.swift
//  JokeApp
//
//  Created by Brianna Babcock on 11/9/20.
//

import UIKit
import CoreData

class FavoritesTableViewController: UITableViewController {
    
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Entry> = {
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
   lazy var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Entry")
    lazy var controller = {
        NSFetchedResultsController<NSFetchRequestResult>(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.shared.context, sectionNameKeyPath: nil, cacheName: nil)
        
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
        try controller.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedAdviceCell", for: indexPath)

        cell.textLabel?.text = "hello"

        return cell
    }
    

}

extension FavoritesTableViewController: NSFetchedResultsControllerDelegate {
    
}
