//
//  LifeAdviceURLController.swift
//  JokeApp
//
//  Created by Brianna Babcock on 10/28/20.
//

import Foundation

class LifeAdviceURLController {
    
    static func fetchAdviceItems(completion: @escaping (String?) -> Void) {
        
        let url = URL(string: "https://api.adviceslip.com/advice")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            
            do {
                
                if let data = data
                {
                    let randomAdviceInfo = try jsonDecoder.decode(AdviceSlip.self, from: data)
                    completion(randomAdviceInfo.advice.text)
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
