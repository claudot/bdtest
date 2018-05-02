//
//  Trackable.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 02/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import Foundation

protocol Trackable {
    var title: String {get}
    var duration: TimeInterval {get}
    var artistName: String {get}
}
