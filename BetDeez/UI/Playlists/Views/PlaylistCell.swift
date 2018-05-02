//
//  PlaylistCell.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 02/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import UIKit

class PlaylistCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    static let reusableIdentifier = "PlaylistCell"
    
    override func awakeFromNib() {
        // Customize view here
        titleLabel.textColor = UIColor.blue
    }
}
