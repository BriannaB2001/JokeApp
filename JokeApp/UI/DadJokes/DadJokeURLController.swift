//
//  DadJokeURLController.swift
//  JokeApp
//
//  Created by Talmage Hassell on 12/21/20.
//


import Foundation

class DadJokeURLController {
    
    static func fetchDadJokeItems(completion: @escaping (String?) -> Void) {
        
        let url = URL(string: "https://icanhazdadjoke.com/")!
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
//        guard let _url = request.url else {
//            fatalError("oops")
//        }
                
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            
            do {
                
                if let data = data
                {
                    let randomDadJokeInfo = try jsonDecoder.decode(DadJokeSlip.self, from: data)
                    completion(randomDadJokeInfo.dadJoke)
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

