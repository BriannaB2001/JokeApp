//
//  CatFactsViewController.swift
//  JokeApp
//
//  Created by Brianna Babcock on 10/23/20.
//

import UIKit

class CatFactsViewController: UIViewController {
    
    var catFacts = [CatFact]()
    var catFactIndex = 0
    
    @IBOutlet weak var catFactButton: UIButton!
    @IBOutlet weak var catFactLabel: UILabel!
    @IBOutlet weak var saveFactButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CatFactsURLController.fetchCatItems { (results) in
            if let results = results {
                self.catFacts = results.shuffled()
            }
        }
    }
    
    func displayResult(result: CatFact?) {
        DispatchQueue.main.async {
            if let result = result {
                
                self.catFactLabel.text = "\(result.text)"
                if CoreDataManager.shared.getAllEntries().contains(where: { $0.text == result.text }) {
                    self.saveFactButton.isSelected = true
                } else {
                    self.saveFactButton.isSelected = false
                }
                
            } else {
                self.catFactLabel.text = "no result"
            }
        }
    }
    
    @IBAction func catFactButtonTapped(_ sender: UIButton) {
        guard !catFacts.isEmpty else {return}
        catFactIndex += 1
        displayResult(result: catFacts[catFactIndex])
        
    }
    
    @IBAction func saveFactButtonTapped(_ sender: UIButton) {
        let currentCatFactText = catFacts[catFactIndex].text
        if let existingEntry =  CoreDataManager.shared.entryForText(text: currentCatFactText ) {
            CoreDataManager.shared.deleteEntry(entry: existingEntry)
            saveFactButton.isSelected = false
        } else {
            CoreDataManager.shared.createNewEntry(text: catFacts[catFactIndex].text, type: .catFact)
            saveFactButton.isSelected = true
        }
    }
}
