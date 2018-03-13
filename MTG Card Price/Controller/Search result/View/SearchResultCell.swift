//
//  RDQSearchResultCell.swift
//  MTG Card Price
//
//  Created by Roudique on 2/25/18.
//  Copyright © 2018 roudique. All rights reserved.
//

import Cocoa

class RDQSearchResultCell: NSTableCellView {
    @IBOutlet weak var manaImageView : NSImageView!
    @IBOutlet weak var nameLabel : NSTextField!
    @IBOutlet weak var priceLabel : NSTextField!
    var mana : RDQMana? {
        willSet {
            guard let newMana = newValue else { return }
            var manaImage : NSImage?
            
            switch newMana {
            case RDQMana.black:
                manaImage = #imageLiteral(resourceName: "mana_black_small")
            case RDQMana.blue:
                manaImage = #imageLiteral(resourceName: "mana_blue_small")
            case RDQMana.green:
                manaImage = #imageLiteral(resourceName: "mana_green_small")
            case RDQMana.red:
                manaImage = #imageLiteral(resourceName: "mana_red_small")
            case RDQMana.white:
                manaImage = #imageLiteral(resourceName: "mana_white_small")
            default:
                return
            }
            
            guard let image = manaImage else { return }
            self.manaImageView.image = image
        }
    }
    
    class var identifier : String {
        return "RDQSearchResultCell"
    }
}
