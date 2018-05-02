//
//  Date+Formatter.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 02/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import Foundation

extension Double {
    func formattedTime()-> String {
        let formatter = DateFormatter()
        let date = Date.init(timeIntervalSince1970: self)
        formatter.setLocalizedDateFormatFromTemplate("HH:mm:ss")
        return formatter.string(from: date)
    }
}
