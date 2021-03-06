//
//  Track.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 01/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Track: Trackable {
    var id: Int64
    var title: String
    var duration: TimeInterval
    var artist: Artist
    
    var artistName: String {
        get {
            return artist.name
        }
    }

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
