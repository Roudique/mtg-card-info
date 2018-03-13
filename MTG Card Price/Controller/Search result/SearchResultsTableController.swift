//
//  SearchResultsTableController.swift
//  MTG Card Price
//
//  Created by Roudique on 2/25/18.
//  Copyright © 2018 roudique. All rights reserved.
//

import Cocoa

class RDQSearchResultsTableController: NSViewController,
                                        NSTableViewDelegate, NSTableViewDataSource,
                                        NSTextFieldDelegate {
    @IBOutlet weak var tableView : NSTableView!
    
    var cards = [RDQCard]()
    
    
    //MARK: - Public methods
    
    func update(cards: [RDQCard]) {
        self.cards = cards
        
        tableView.reloadData()
    }
    
    
    //MARK: - NSTableViewDataSource
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return cards.count
    }
    
    
    //MARK: - NSTableViewDelegate
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: RDQSearchResultCell.identifier), owner: nil) as? RDQSearchResultCell else { return nil }
        
        let card = cards[row]
        
        cell.nameLabel.stringValue = card.name
        cell.priceLabel.stringValue = "$\(card.price)"
        cell.mana = card.color
        
        return cell
    }
}
