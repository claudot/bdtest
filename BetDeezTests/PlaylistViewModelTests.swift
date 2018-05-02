//
//  PlaylistViewModelTests.swift
//  BetDeezTests
//
//  Created by Paul-Anatole CLAUDOT on 02/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import XCTest
import RxSwift
import RxTest

@testable import BetDeez

class PlaylistViewModelTests: XCTestCase {
    
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
            XCTAssert(playlists.count == 25, "Should be 25 playlists for user 5")
            XCTAssert(playlists.first?.authorName == "Daniel Marhely", "Should be Daniel Marhely")
            XCTAssert(playlists.last?.duration == 566, "Should be 566")
            XCTAssert(playlists[11].title == "Club Med", "Should be Club Med")
            waitExpectation.fulfill()
        })

        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
}

