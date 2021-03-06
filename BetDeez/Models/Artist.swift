//
//  Artist.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 01/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Artist {
    var id: Int64
    var name: String
    
    init?(json: JSON) {
        
        guard   let id = json["id"].int64,
            let name = json["name"].string
            else {
                return nil
        }
        
        self.id = id
        self.name = name
    }

}
