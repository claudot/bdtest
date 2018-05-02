//
//  TrackCell.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 02/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    @IBOutlet weak var titleAndArtistLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    static let reusableIdentifier = "TrackCell"
}
