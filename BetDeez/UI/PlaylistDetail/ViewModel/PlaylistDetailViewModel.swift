//
//  PlaylistDetailViewModel.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 02/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import RxSwift

final class PlaylistDetailViewModel {
    
    //MARK: - Dependecies
    private let playlist: Observable<Playlistable>
    private let disposeBag = DisposeBag()
    
    //MARK: - Model
    let tracks: Observable<[Trackable]>
    let title: Observable<String>
    let duration: Observable<String>
    let cover: Observable<String>

    //MARK: - Set up
    init(playlist: Observable<Playlistable>) {
        
        //Initialise dependencies
        self.playlist = playlist
        
        // Subscribe playlists
        tracks = playlist.flatMap {
            Api.sharedApi.getTracksList(stringUrl: $0.tracklist)
        }
        
        //Initialise observers
        title = playlist.map { $0.title }
        duration = playlist.map { $0.duration.formattedTime() }
        cover = playlist.map { $0.cover }
    }
}

