//
//  InspirationalQuoteViewController.swift
//  JokeApp
//
//  Created by Talmage Hassell on 12/21/20.
//
//
import UIKit

class InspirationalQuoteViewController: UIViewController {
    
    @IBOutlet weak var randomIQButton: UIButton!
    
    @IBOutlet weak var randomIQLabel: UILabel!
    

    
    var iqItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func displayResult() {
        if let iqItem = iqItem {
            DispatchQueue.main.async {
                
                self.randomIQLabel.text = "\(iqItem)"
            }
        } else {
            DispatchQueue.main.async {
            self.randomIQLabel.text = "no result"
        }
    }
}
    
    @IBAction func randomIQtapped(_ sender: Any) {
        InspirationalQuotesURLController.fetchIQItems { (iqItem) in
            self.iqItem = iqItem
            self.displayResult()
        }

    }
    
    
    
}
