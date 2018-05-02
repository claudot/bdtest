//
//  Api+Track.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 01/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import RxSwift
import RxAlamofire
import SwiftyJSON

extension Api {
    func getTracksList(stringUrl: String)-> Observable<[Trackable]> {
        let path = stringUrl
        
        return  requestJSON(.get, path, parameters: nil)
            .map{
                JSON.init($0.1)
            }
            .flatMap{ json -> Observable<[Trackable]> in
                guard let trackssData = json["data"].array else {
                    return Observable.empty()
                }
                let tracks = trackssData.flatMap(Track.init)
                return Observable.just(tracks)
        }
    }
}
