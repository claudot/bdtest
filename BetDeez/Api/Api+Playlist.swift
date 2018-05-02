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
                JSON.init($0.1)
            }
            .flatMap{ json -> Observable<[Playlistable]> in
                guard let playslistsData = json["data"].array else {
                    return Observable.empty()
                }
                let playlists = playslistsData.flatMap(Playlist.init)
                return Observable.just(playlists)
        }
    }
}

