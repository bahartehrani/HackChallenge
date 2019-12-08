//
//  Spot.swift
//  Spots
//
//  Created by Productivity on 12/3/19.
//  Copyright © 2019 Productivity. All rights reserved.
//

import Foundation

class Spot {
    
    var title : String
    var tags : [String]
    var numberFavorited : Int
    var openClosed : Bool
    var resources : [String]
    var hours : [String]

    var isFavorite : Bool
    
    
    init(name: String, isFav: Bool) {
        self.title = name
        isFavorite = isFav
        tags = []
        numberFavorited = 0
        openClosed = false
        resources = []
        hours = []
    }
    
    init(name: String, isFav: Bool, tags: [String], numberFavorited: Int, openClosed: Bool, resources: [String], hours: [String]) {
        self.title = name
        self.isFavorite = isFav
        self.tags = tags
        self.numberFavorited = numberFavorited
        self.openClosed = openClosed
        self.resources = resources
        self.hours = hours
    }
    
    
    
    
}
