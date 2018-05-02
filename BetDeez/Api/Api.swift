//
//  Api.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 01/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire
import SwiftyJSON
import AlamofireNetworkActivityIndicator

class Api {
    static let sharedApi = Api()
    
    init() {
        NetworkActivityIndicatorManager.shared.isEnabled = true
    }

    struct Constants {
        static let baseURL = "https://api.deezer.com/"
    }
}
