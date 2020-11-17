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
    
    var adviceItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func displayResult() {
        if let adviceItem = adviceItem {
            DispatchQueue.main.async {
                
                self.randomAdviceLabel.text = "\(adviceItem)"
            }
        } else {
            DispatchQueue.main.async {
            self.randomAdviceLabel.text = "no result"
        }
    }
}
    
    @IBAction func randomAdviceButtonTapped(_ sender: Any) {
        LifeAdviceURLController.fetchAdviceItems { (adviceItem) in
            self.adviceItem = adviceItem
            self.displayResult()
        }
    }
    
    @IBAction func saveAdviceButtonTapped(_ sender: UIButton) {
        guard let adviceItem = adviceItem else {return}
        CoreDataManager.shared.createNewEntry(text: adviceItem, type: .advice)
        
        saveAdviceButton.isSelected = !saveAdviceButton.isSelected
    
        
    }
}
