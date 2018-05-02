//
//  Playlistable.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 02/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import Foundation

protocol Playlistable {
    func getTitle() -> String
    func getThumbnail() -> String
    func getCover() -> String
    func getTracklist() -> String
    func getDuration() -> TimeInterval
    func getAuthorName() -> String
}
