//
//  APIManager.swift
//  MTG Card Price
//
//  Created by Oleksandr Rudavka on 2018-02-15.
//  Copyright © 2018 roudique. All rights reserved.
//

import Foundation

class RDQAPIManager {
    static func searchFor(cardWith name: String, completion: @escaping (String?) -> ()) {
        
        let apiString = "https://shop.tcgplayer.com/magic/product/show?newSearch=true&ProductName="
        let validatedName = name.replacingOccurrences(of: " ", with: "%20")

        if let url = URL.init(string: apiString + validatedName) {
            
            let config = URLSessionConfiguration.default
            let session = URLSession.init(configuration: config)
            let _ = session.dataTask(with: url, completionHandler: { data, response, error in
                print("Error: \(error)")
                print("Response: \(response)")
                print("DATA:\n\(data)\nEND DATA\n")
                
                if let data = data,
                    let string = String.init(data: data, encoding: .utf8) {
                    
                    if let parsedString = RDQParser.parse(html: string) {
                        completion(parsedString)
                        return
                    }
                }
                
                completion(nil)
            }).resume()
            
        }
    }
    
    
}
