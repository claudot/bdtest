//
//  Playlist.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 01/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Playlist: Playlistable{
    var id: Int64
    var title: String
    var thumbnail: String
    var cover: String
    var tracklist: String
    var duration: TimeInterval
    var author: Author
    
    var authorName: String {
        get {
            return author.name
        }
    }
    
    init?(json: JSON) {
        
        guard   let id = json["id"].int64,
                let title = json["title"].string,
                let thumbnail = json["picture_medium"].string,
                let cover = json["picture_xl"].string,
                let tracklist = json["tracklist"].string,
                let duration = json["duration"].double,
                let author = Author.init(json: json["creator"])
        else {
            return nil
        }
        
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.cover = cover
        self.tracklist = tracklist
        self.duration = duration
        self.author = author
    }
//    TODO Replace old parsing with the new codable protocol
//    enum CodingKeys: String, CodingKey
//    {
//        case id = "id"
//        case title = "title"
//        case thumbnail = "picture_medium"
//        case cover = "picture_xl"
//        case tracklist = "tracklist"
//        case duration = "duration"
//        case author = "creator"
//    }
}
