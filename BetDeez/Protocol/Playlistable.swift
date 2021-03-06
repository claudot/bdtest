//
//  Playlistable.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 02/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import Foundation

protocol Playlistable {
    var title: String {get}
    var thumbnail: String {get}
    var cover: String {get}
    var tracklist: String {get}
    var duration: TimeInterval {get}
    var authorName: String {get}
}
