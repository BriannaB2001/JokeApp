//
//  InspirationalQuoteURLController.swift
//  JokeApp
//
//  Created by Talmage Hassell on 12/21/20.
//

import Foundation

class InspirationalQuotesURLController {
    
    static func fetchIQItems(completion: @escaping (String?) -> Void) {
    
    let methodQueryItem = URLQueryItem(name: "method", value: "getQuote")
    let formatQueryItem = URLQueryItem(name: "format", value: "json")
    let langQueryItem = URLQueryItem(name: "lang", value: "en")
    
    guard var urlComponents = URLComponents(string: "http://api.forismatic.com/api/1.0/") else {
        fatalError("Come on!")
    }
    
    urlComponents.queryItems = [methodQueryItem, formatQueryItem, langQueryItem]
    
    guard let urlFINAL = urlComponents.url else {
        fatalError("AaAAA")
    }
    
    let task = URLSession.shared.dataTask(with: urlFINAL) { (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            
            do {
                
                if let data = data
                {
                    let randomIQInfo = try jsonDecoder.decode(IQSlip.self, from: data)
                    completion(randomIQInfo.iq)
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
