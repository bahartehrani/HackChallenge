//
//  Spot.swift
//  Spots
//
//  Created by Productivity on 12/3/19.
//  Copyright © 2019 Productivity. All rights reserved.
//

import Foundation

struct SpotResponse: Codable {
    var success : Bool
    var data : [readSpot]
}

struct readSpot : Codable {
    
    var id: Int
    var name : String
    var numOfFavorited : Int
    var tags : [String]
    var opening : String
    var closing : String
    var isopening : Bool
    var listview_imageurl : String
    var detailedview_imageurl : String
    
}

class Spot {
    
    var readInfo : readSpot?
    var id: Int
    var name : String
    var numOfFavorited : Int
    var tags : [String]
    var opening : String
    var closing : String
    var isopening : Bool
    var listview_imageurl : String
    var detailedview_imageurl : String
    
    var resources : [String]
    var tagsSelected : Int
    var isFavorite : Bool
    
    
    init(readInfo: readSpot) {
        self.readInfo = readInfo
        
        self.id = readInfo.id
        self.name = readInfo.name
        self.tags = readInfo.tags
        self.numOfFavorited = readInfo.numOfFavorited
        self.isopening = readInfo.isopening
        self.opening = readInfo.opening
        self.closing = readInfo.closing
        isFavorite = false
        resources = []
        tagsSelected = 0
        self.listview_imageurl = readInfo.listview_imageurl
        self.detailedview_imageurl = readInfo.detailedview_imageurl
        
        if(self.isopening) {
            self.tags.append("open")
        }
        else {
            self.tags.append("closed")
        }
        
        
    }
    
    init (name: String) {
        self.id = 0
        self.name = name
        self.tags = []
        self.numOfFavorited = 0
        self.isopening = false
        self.opening = ""
        self.closing = ""
        isFavorite = false
        resources = []
        tagsSelected = 0
        listview_imageurl = ""
        detailedview_imageurl = ""
    }
    
    
    func equals(spot: Spot) -> Bool {
        return self.name == spot.name
    }
    
    
}


