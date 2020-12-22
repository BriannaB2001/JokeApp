//
//  DadJokesViewController.swift
//  JokeApp
//
//  Created by Talmage Hassell on 12/20/20.
//


import UIKit

class DadJokesViewController: UIViewController {
    
    @IBOutlet weak var randomDadJokeButton: UIButton!
    
    @IBOutlet weak var randomDadJokeLabel: UILabel!


    
    var dadJokeItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func displayResult() {
        if let dadJokeItem = dadJokeItem {
            DispatchQueue.main.async {
                
                self.randomDadJokeLabel.text = "\(dadJokeItem)"
            }
        } else {
            DispatchQueue.main.async {
            self.randomDadJokeLabel.text = "no result"
        }
    }
}
    
    @IBAction func randomDadJokeButtonTapped(_ sender: Any) {
        DadJokeURLController.fetchDadJokeItems { (dadJokeItem) in
            self.dadJokeItem = dadJokeItem
            self.displayResult()
        }
        
    }
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let dadJokeItem = dadJokeItem else { return }
        
        if let existingEntry =  CoreDataManager.shared.entryForText(text: dadJokeItem ) {
            CoreDataManager.shared.deleteEntry(entry: existingEntry)
            saveButton.isSelected = false
        } else {
            CoreDataManager.shared.createNewEntry(text: dadJokeItem, type: .dadJoke)
            saveButton.isSelected = true
        }
        
        
    }
    
    
}

