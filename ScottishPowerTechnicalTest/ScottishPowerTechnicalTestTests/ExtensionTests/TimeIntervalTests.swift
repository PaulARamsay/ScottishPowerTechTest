//
//  TimeIntervalTests.swift
//  ScottishPowerTechnicalTestTests
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation
import XCTest

@testable import ScottishPowerTechnicalTest
class TimeIntervalTests: XCTestCase {
    
    func testTimeIntervalFormattedAsDuration() {
        XCTAssertEqual(TimeInterval(floatLiteral: 720).formattedInMinutesSeconds, "12:00")
        XCTAssertEqual(TimeInterval(floatLiteral: 0).formattedInMinutesSeconds, "00:00")
        XCTAssertEqual(TimeInterval(floatLiteral: 60).formattedInMinutesSeconds, "01:00")
        XCTAssertEqual(TimeInterval(floatLiteral: 1).formattedInMinutesSeconds, "00:01")
    }
}
