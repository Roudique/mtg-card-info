//
//  Parser.swift
//  MTG Card Price
//
//  Created by Oleksandr Rudavka on 2018-02-15.
//  Copyright © 2018 roudique. All rights reserved.
//

import Foundation
import SwiftSoup

class RDQParser {
    static func parse(html: String) -> String? {
        let doc: Document = try! SwiftSoup.parse(html)
        
        let lol = try! doc.body()?.select("dl")
        if lol!.hasClass("product__market-price") {
            let element = lol!.first(where: { element in
                if try! element.className() == "product__market-price" {
                    return true
                }
                return false
            })
            
            if let element = element {
                if let priceString = try? element.select("dd").first()!.html() {
                    return priceString
                }
            }
        }
        
        return nil
    }
}
