//
//  Error.swift
//  MTG Card Price
//
//  Created by Roudique on 2/25/18.
//  Copyright © 2018 roudique. All rights reserved.
//

import Foundation

class RDQError: Error {
    let statusCode : Int
    let message : String
    
    init(statusCode: Int, message: String) {
        self.statusCode = statusCode
        self.message = message
    }
    
    convenience init(with error: Error) {
        self.init(statusCode: -1, message: error.localizedDescription)
    }
    
}
