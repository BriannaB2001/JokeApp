//
//  LifeAdviceTableViewController.swift
//  JokeApp
//
//  Created by Brianna Babcock on 11/9/20.
//

import UIKit

class LifeAdviceTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedAdviceCell", for: indexPath)

        cell.textLabel?.text = "hello"

        return cell
    }
    

}
