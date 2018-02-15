//
//  ViewController.swift
//  MTG Card Price
//
//  Created by Oleksandr Rudavka on 2018-02-15.
//  Copyright © 2018 roudique. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var searchField: NSSearchField!
    @IBOutlet weak var priceLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func searchAction(_ sender: Any) {
        if searchField.stringValue.count > 0 {
            RDQAPIManager.searchFor(cardWith: searchField.stringValue)
        }
    }
    
}

