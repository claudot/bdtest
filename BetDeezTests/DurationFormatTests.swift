//
//  DurationFormatTests.swift
//  BetDeezTests
//
//  Created by Paul-Anatole CLAUDOT on 02/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import XCTest

@testable import BetDeez

class DurationFormatTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFormatDurations() {
        let duration1:Double = 1000
        XCTAssert(duration1.formattedTime() == "00:16:40", "Should format correctly like 01:16:40")
        
        let duration2:Double = 0
        XCTAssert(duration2.formattedTime() == "00:00:00", "0 Should format correctly like 00:00:00")
        
        let duration3:Double = 86399
        XCTAssert(duration3.formattedTime() == "23:59:59", "0 Should format correctly like 23:59:59")
        
        let duration4:Double = 86400
        XCTAssert(duration4.formattedTime() == "More than a day!", "0 Should format correctly like More than a day")

        let duration5:Double = -1
        XCTAssert(duration5.formattedTime() == "00:00:00", "0 Should format correctly 00:00:00")

    }
    
}

