//
//  CurrencyAmountTests.swift
//  ScottishPowerTechnicalTestTests
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation
import XCTest

@testable import ScottishPowerTechnicalTest
class CurrencyAmountTests: XCTestCase {
    
    func testAmountWasFormatted() {
        XCTAssertEqual(CurrencyAmount(underlyingValue: 10).formattedAmount(), "£10.00")
        XCTAssertEqual(CurrencyAmount(underlyingValue: 1).formattedAmount(), "£1.00")
        XCTAssertEqual(CurrencyAmount(underlyingValue: 0.1).formattedAmount(), "£0.10")
        XCTAssertEqual(CurrencyAmount(underlyingValue: 0.01).formattedAmount(), "£0.01")
    }
}
