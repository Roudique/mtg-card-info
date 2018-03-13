//
//  ViewController.swift
//  MTG Card Price
//
//  Created by Oleksandr Rudavka on 2018-02-15.
//  Copyright © 2018 roudique. All rights reserved.
//

import Cocoa

class RDQMainViewController: NSViewController, NSSearchFieldDelegate {
    @IBOutlet weak var searchField: NSSearchField!
    @IBOutlet weak var priceLabel: NSTextField!
    @IBOutlet weak var activityIndicator: NSProgressIndicator!
    
    
    
    var searchResultsController : RDQSearchResultsTableController {
        for childController in self.childViewControllers {
            if let controller = childController as? RDQSearchResultsTableController {
                return controller
            }
        }
        fatalError("Tab controller is missing")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchField.delegate = self
    }
    
    
    //MARK: - NSSearchFieldDelegate
    
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        
        if commandSelector == #selector(NSResponder.insertNewline(_:)) {
            performSearch()
        }
        
        return false
    }
    
    
    func performSearch() {
        if searchField.stringValue.count > 0 {
            activityIndicator.isHidden = false
            activityIndicator.startAnimation(nil)
            
            RDQAPIManager.searchFor(cardWith: searchField.stringValue, completion: { cards, error  in
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimation(nil)
                    self.activityIndicator.isHidden = true
                    
                    if let _ = error {
                        self.priceLabel.stringValue = "Error occured."
                    } else if let firstCard = cards?.first {
                        self.priceLabel.stringValue = "$\(firstCard.price)"
                    } else {
                        self.priceLabel.stringValue = "No cards found."
                    }
                    
                    guard let cards = cards else { return }
                    
                    self.searchResultsController.update(cards: cards)
                }
            })
        }
    }
    
    @IBAction func searchAction(_ sender: Any) {
        performSearch()
    }
    
}

