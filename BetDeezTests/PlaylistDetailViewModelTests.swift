//
//  PlaylistDetailViewModelTests.swift
//  BetDeezTests
//
//  Created by Paul-Anatole CLAUDOT on 02/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import XCTest
import RxSwift
import RxTest

@testable import BetDeez

class PlaylistDetailViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Ithink I should use this instead of expectation
        let scheduler = TestScheduler(initialClock: 0)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testModel() {
        // Define an expectation
        let waitExpectation = expectation(description: "Api should return a value")
        
        // Asynch Code
        let model = PlaylistsViewModel(userId: "5")
        _ = model.playlists.subscribe(onNext: { (playlists) in
            let p2 = playlists[2]
            let model2 = PlaylistDetailViewModel(playlist: Observable.from(optional: p2))
            _ = model2.tracks.subscribe(onNext: { (tracks) in
                XCTAssert(tracks.count == 25, "Should be 10 tracks")
                XCTAssert(tracks.first?.artistName == "Hezron", "Should be Hezron")
                XCTAssert(tracks.last?.duration == 206, "Should be 206")
                XCTAssert(tracks[5].title == "Puff Puff Pass", "Puff Puff Pass")
                waitExpectation.fulfill()
            })
        })
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
}
