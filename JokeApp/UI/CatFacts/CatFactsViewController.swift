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
                self.catFacts = results
            }
        }
    }
    
    func displayResult(result: CatFact?) {
        if let result = result {
            DispatchQueue.main.async {
                
                self.catFactLabel.text = "\(result.text)"
            }
        }
    }
    
    @IBAction func catFactButtonTapped(_ sender: UIButton) {
        displayResult(result: catFacts[catFactIndex])
        catFactIndex += 1
    }
    
    @IBAction func saveFactButtonTapped(_ sender: UIButton) {
        saveFactButton.isSelected = !saveFactButton.isSelected
        CoreDataManager.shared.createNewEntry(text: catFacts[catFactIndex].text, type: .catFact)
    }
    
}
