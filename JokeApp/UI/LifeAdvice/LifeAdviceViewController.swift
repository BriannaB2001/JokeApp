//
//  LifeAdviceViewController.swift
//  JokeApp
//
//  Created by Brianna Babcock on 10/30/20.
//

import UIKit

class LifeAdviceViewController: UIViewController {
    
    @IBOutlet weak var randomAdviceButton: UIButton!
    @IBOutlet weak var randomAdviceLabel: UILabel!
    @IBOutlet weak var saveAdviceButton: UIButton!
    
    var adviceItem: Advice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LifeAdviceURLController.fetchAdviceItems { (results) in
            if let results = results {
                self.adviceItem = results
            }
        }
    }
    
    func displayResult() {
        guard let adviceItem = adviceItem else {
            self.randomAdviceLabel.text = "no result"
            return
        }
        
        self.randomAdviceLabel.text = "\(adviceItem)"
        
        if CoreDataManager.shared.getAllEntries().contains(where: { $0.text == adviceItem.text }) {
            self.saveAdviceButton.isSelected = true
        } else {
            self.saveAdviceButton.isSelected = false
        }
    }
    
    
    @IBAction func randomAdviceButtonTapped(_ sender: Any) {
        LifeAdviceURLController.fetchAdviceItems { (adviceItem) in
            self.adviceItem = adviceItem
            DispatchQueue.main.async {
                self.displayResult()
            }
        }
    }
    @IBAction func saveAdviceButtonTapped(_ sender: UIButton) {
        guard let adviceItem = adviceItem else {return}
        CoreDataManager.shared.createNewEntry(text: adviceItem.text, type: .advice)
        
        saveAdviceButton.isSelected = !saveAdviceButton.isSelected
    }
}
