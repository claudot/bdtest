//
//  Api+Playlist.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 01/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import RxSwift
import RxAlamofire
import SwiftyJSON

extension Api {
    func getPlaylists(url: String)-> Observable<[Playlistable]> {
        return  requestJSON(.get, url, parameters: nil)
            .map{
                // Convert to JSON with SwiftyJSON
                JSON.init($0.1)
            }
            .flatMap{ json -> Observable<[Playlistable]> in
                // Convert json to Observable High level object with custom mapper
                // We should use Codable protocol to do it and let the protocol handle it
                guard let playslistsData = json["data"].array else {
                    return Observable.empty()
                }
                let playlists = playslistsData.flatMap(Playlist.init)
                return Observable.just(playlists)
        }
    }
}

