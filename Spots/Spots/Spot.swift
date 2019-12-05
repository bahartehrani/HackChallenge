//
//  Spot.swift
//  Spots
//
//  Created by Productivity on 12/3/19.
//  Copyright © 2019 Productivity. All rights reserved.
//

import Foundation

class Spot {
    
    var name : String
    var isFavorite : Bool
    
    init(name: String, isFav: Bool) {
        self.name = name
        isFavorite = isFav
    }
}
