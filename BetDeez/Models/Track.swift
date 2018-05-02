//
//  Track.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 01/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Track {
    let id: Int64
    let title: String
    let duration: Double
    let artist: Artist
    
    init?(json: JSON) {
        
        guard   let id = json["id"].int64,
                let title = json["title"].string,
                let duration = json["duration"].double,
                let artist = Artist.init(json: json["artist"])
            else {
                return nil
        }
        
        self.id = id
        self.title = title
        self.duration = duration
        self.artist = artist
    }
}
