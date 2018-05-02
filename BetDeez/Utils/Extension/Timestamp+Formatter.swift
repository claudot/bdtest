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
        if (self >= 86400) {
            return NSLocalizedString("More than a day!", comment: "")
        }
        if (self < 0) {
            return "00:00:00"
        }
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        let date = Date(timeIntervalSince1970: self)
        formatter.setLocalizedDateFormatFromTemplate("HH:mm:ss")
        return formatter.string(from: date)
    }
}
