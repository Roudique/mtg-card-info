//
//  APIManager.swift
//  MTG Card Price
//
//  Created by Oleksandr Rudavka on 2018-02-15.
//  Copyright © 2018 roudique. All rights reserved.
//

import Foundation

class RDQAPIManager {
    static let baseAPIURL = "https://api.scryfall.com/"
    
    static func searchFor(cardWith name: String, completion: @escaping (String?) -> ()) {
        
        let apiString = baseAPIURL + "cards/search?q="
        let validatedName = name.replacingOccurrences(of: " ", with: "+")

        if let url = URL.init(string: apiString + validatedName) {
            
            let config = URLSessionConfiguration.default
            let session = URLSession.init(configuration: config)
            let _ = session.dataTask(with: url, completionHandler: { data, response, error in
                print("Error: \(error)")
                print("Response: \(response)")
                print("DATA:\n\(data)\nEND DATA\n")
                
                if let data = data, let dataString = String.init(data: data, encoding: .utf8) {
                    if let json = try! JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
                        
                        let totalCards = json["total_cards"]
                        
                        if let cardDictsArray = json["data"] as? [[String : Any]] {
                            if let card = RDQCard.init(with: cardDictsArray.first!) {
                                completion("\(card.price)")
                                return
                            }

                        }
                        
                    }
                }
                
                completion("No data")
            }).resume()
            
        }
    }
    
    
}
