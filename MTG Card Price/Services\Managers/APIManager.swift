//
//  APIManager.swift
//  MTG Card Price
//
//  Created by Oleksandr Rudavka on 2018-02-15.
//  Copyright © 2018 roudique. All rights reserved.
//

import Foundation
import SwiftyJSON

class RDQAPIManager {
    static let baseAPIURL = "https://api.scryfall.com/"
    
    static func searchFor(cardWith name: String, completion: @escaping ([RDQCard]?, RDQError?) -> ()) {
        
        let apiString = baseAPIURL + "cards/search?q="
        let validatedName = name.replacingOccurrences(of: " ", with: "+")

        if let url = URL.init(string: apiString + validatedName) {
            
            let config = URLSessionConfiguration.default
            let session = URLSession.init(configuration: config)
            let _ = session.dataTask(with: url, completionHandler: { data, response, error in
                if let error = error {
                    completion(nil, RDQError(with: error))
                    return
                }
                
                guard let data = data, let json = try? JSON(data: data) else {
                    let parseError = RDQError(statusCode: -1, message: "Couldn't parse JSON.")
                    completion(nil, parseError)
                    return
                }
                
                let totalCards = json["total_cards"].intValue
                print("Total cards returned: \(totalCards)")
                
                if let cardsData = json["data"].array {
                    var cards = [RDQCard]()
                    
                    for cardData in cardsData {
                        if let card = RDQCard.init(with: cardData) {
                            print("\(card.name) for $\(card.price)")
                            cards.append(card)
                        }
                    }
                    
                    completion(cards, nil)
                    return
                }
 
                completion(nil, nil)
            }).resume()
            
        }
    }
    
    
}
