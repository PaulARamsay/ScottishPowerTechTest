//
//  IntTests.swift
//  ScottishPowerTechnicalTestTests
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation
import XCTest

@testable import ScottishPowerTechnicalTest
class IntTests: XCTestCase {
    
    func testDidPluraliseForSecond() {
        var minutes = 1
        XCTAssertEqual(minutes.pluralised(nonPluralForm: "minute", pluralForm: "minutes"), "1 minute")
        
        minutes = -1
        XCTAssertEqual(minutes.pluralised(nonPluralForm: "minute", pluralForm: "minutes"), "-1 minute")
    }
    
    func testDidPluraliseForSeconds() {
        var minutes = 2
        XCTAssertEqual(minutes.pluralised(nonPluralForm: "minute", pluralForm: "minutes"), "2 minutes")
        
        minutes = -2
        XCTAssertEqual(minutes.pluralised(nonPluralForm: "minute", pluralForm: "minutes"), "-2 minutes")
    }
}
