//
//  CatFactsURLController.swift
//  JokeApp
//
//  Created by Brianna Babcock on 10/22/20.
//

import Foundation

class CatFactsURLController {
    
    static func fetchCatItems(completion: @escaping ([CatFact]?) -> Void) {
        let url = URL(string: "https://cat-fact.herokuapp.com/facts")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            
            do {
                if let data = data {
                    let catFactInfo = try jsonDecoder.decode([CatFact].self, from: data)
                    completion(catFactInfo)
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
