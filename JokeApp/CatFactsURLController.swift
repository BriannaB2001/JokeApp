//
//  CatFactsURLController.swift
//  JokeApp
//
//  Created by Brianna Babcock on 10/22/20.
//

import Foundation

class CatFactsURLController {
    
    static func fetchItems(completion: @escaping ([CatFact]?) -> Void) {
        
        let url = URL(string: "https://cat-fact.herokuapp.com/facts")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            
            do {
                
                if let data = data
                {
                    let catFactInfo = try jsonDecoder.decode(CatFacts.self, from: data)
                    completion(catFactInfo.all)
                } else {
                    completion(nil)
                }
            } catch {
                print(error)
                
            }
        }
        task.resume()
    }
}
