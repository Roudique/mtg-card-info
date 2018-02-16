//
//  RDQCard.swift
//  MTG Card Price
//
//  Created by Oleksandr Rudavka on 2018-02-16.
//  Copyright © 2018 roudique. All rights reserved.
//

import Cocoa

struct RDQCardImagePath {
    let smallPath : String?
    let mediumPath : String?
    let largePath : String?
    let artPath : String?
}

class RDQCard {
    let name : String
    let price : Double
    let imageURI : RDQCardImagePath
    
    init?(with dict: [String : Any]) {
        guard let name = dict["name"] as? String else { return nil }
        guard let usd = dict["usd"] as? String else { return nil }
        guard let imageURIs = dict["image_uris"] as? [String : String] else { return nil }
        
        self.name = name
        guard let price = Double(usd) else { return nil }
        self.price = price
        
        self.imageURI = RDQCardImagePath(smallPath: imageURIs["small"],
                                         mediumPath: imageURIs["normal"],
                                         largePath: imageURIs["large"],
                                         artPath: imageURIs["art_crop"])
    }
}

//{
//    "object": "card",
//    "id": "a5eba273-0b83-42a7-b8b0-9e0cd6a7aa6f",
//    "oracle_id": "0d0d97dd-2653-4d37-b475-ac3b50c5ee53",
//    "multiverse_ids": [
//    6492
//    ],
//    "name": "Alaborn Zealot",
//    "uri": "https://api.scryfall.com/cards/p02/6",
//    "scryfall_uri": "https://scryfall.com/card/p02/6?utm_source=api",
//    "layout": "normal",
//    "highres_image": true,
//    "image_uris": {
//        "small": "https://img.scryfall.com/cards/small/en/p02/6.jpg?1517813031",
//        "normal": "https://img.scryfall.com/cards/normal/en/p02/6.jpg?1517813031",
//        "large": "https://img.scryfall.com/cards/large/en/p02/6.jpg?1517813031",
//        "png": "https://img.scryfall.com/cards/png/en/p02/6.png?1517813031",
//        "art_crop": "https://img.scryfall.com/cards/art_crop/en/p02/6.jpg?1517813031",
//        "border_crop": "https://img.scryfall.com/cards/border_crop/en/p02/6.jpg?1517813031"
//    },
//    "cmc": 1,
//    "type_line": "Creature — Human Soldier",
//    "oracle_text": "When Alaborn Zealot blocks a creature, destroy that creature and Alaborn Zealot.",
//    "mana_cost": "{W}",
//    "power": "1",
//    "toughness": "1",
//    "colors": [
//    "W"
//    ],
//    "color_identity": [
//    "W"
//    ],
//    "legalities": {
//        "standard": "not_legal",
//        "frontier": "not_legal",
//        "modern": "not_legal",
//        "pauper": "not_legal",
//        "legacy": "legal",
//        "penny": "not_legal",
//        "vintage": "legal",
//        "duel": "legal",
//        "commander": "legal",
//        "1v1": "not_legal",
//        "future": "not_legal"
//    },
//    "reserved": false,
//    "reprint": false,
//    "set": "p02",
//    "set_name": "Portal: Second Age",
//    "set_uri": "https://api.scryfall.com/sets/p02",
//    "set_search_uri": "https://api.scryfall.com/cards/search?order=set&q=e%3Ap02&unique=prints",
//    "scryfall_set_uri": "https://scryfall.com/sets/p02?utm_source=api",
//    "rulings_uri": "https://api.scryfall.com/cards/p02/6/rulings",
//    "prints_search_uri": "https://api.scryfall.com/cards/search?order=set&q=%21%E2%80%9CAlaborn+Zealot%E2%80%9D&unique=prints",
//    "collector_number": "6",
//    "digital": false,
//    "rarity": "uncommon",
//    "illustration_id": "92e74726-cafd-4421-97e9-ca31adfcad65",
//    "artist": "David Horne",
//    "frame": "1997",
//    "full_art": false,
//    "border_color": "black",
//    "timeshifted": false,
//    "colorshifted": false,
//    "futureshifted": false,
//    "edhrec_rank": 13202,
//    "usd": "1.72",
//    "eur": "0.42",
//    "related_uris": {
//        "gatherer": "http://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid=6492",
//        "tcgplayer_decks": "http://decks.tcgplayer.com/magic/deck/search?contains=Alaborn+Zealot&page=1&partner=Scryfall",
//        "edhrec": "http://edhrec.com/route/?cc=Alaborn+Zealot",
//        "mtgtop8": "http://mtgtop8.com/search?MD_check=1&SB_check=1&cards=Alaborn+Zealot"
//    },
//    "purchase_uris": {
//        "amazon": "https://www.amazon.com/gp/search?ie=UTF8&index=toys-and-games&keywords=Alaborn+Zealot&tag=scryfall-20",
//        "ebay": "http://rover.ebay.com/rover/1/711-53200-19255-0/1?campid=5337966903&icep_catId=19107&icep_ff3=10&icep_sortBy=12&icep_uq=Alaborn+Zealot&icep_vectorid=229466&ipn=psmain&kw=lg&kwid=902099&mtid=824&pub=5575230669&toolid=10001",
//        "tcgplayer": "http://store.tcgplayer.com/magic/portal-second-age/alaborn-zealot?partner=Scryfall",
//        "magiccardmarket": "https://www.cardmarket.com/Magic/Products/Singles/Portal+Second+Age/Alaborn+Zealot?referrer=scryfall",
//        "cardhoarder": "https://www.cardhoarder.com/cards?affiliate_id=scryfall&data%5Bsearch%5D=Alaborn+Zealot&ref=card-profile&utm_campaign=affiliate&utm_medium=card&utm_source=scryfall",
//        "card_kingdom": "https://www.cardkingdom.com/catalog/item/24007?partner=scryfall&utm_campaign=affiliate&utm_medium=scryfall&utm_source=scryfall",
//        "mtgo_traders": "http://www.mtgotraders.com/store/search.php?q=Alaborn+Zealot&referral=scryfall",
//        "coolstuffinc": "http://www.coolstuffinc.com/p/Magic%3A+The+Gathering/Alaborn+Zealot?utm_source=scryfall"
//    }
//}

