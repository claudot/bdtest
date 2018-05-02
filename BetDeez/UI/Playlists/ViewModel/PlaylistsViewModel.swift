//
//  PlaylistsViewModel.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 02/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import RxSwift

final class PlaylistsViewModel {
    
    //MARK: - Dependecies
    private let userId: String
    private let disposeBag = DisposeBag()
    
    
    //MARK: - Model
    let playlists: Observable<[Playlistable]>

    //MARK: - Set up
    init(userId: String) {
        
        //Initialise dependencies
        self.userId = userId
        
        // Subscribe playlists
        playlists = Api.sharedApi.getPlaylists(url: "\(Api.Constants.DeezerBaseURL)user/\(userId)/playlists")

        //Initialise observers --> None here
    }
}
