//
//  RockTrackDetailsViewModelTests.swift
//  ScottishPowerTechnicalTestTests
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation
import XCTest

@testable import ScottishPowerTechnicalTest
class RockTrackDetailsViewModelTests: XCTestCase {
    
    private var viewModel: RockTrackDetailsViewModel!
    
    override func setUpWithError() throws {
        self.viewModel = .init(selectedTrack: .mock())
    }
    
    func testNumberOfRowsAndSecionds() {
        XCTAssertEqual(self.viewModel.sections.count, 1)
        XCTAssertEqual(self.viewModel.sections[0].rows.count, 3)
    }

    func testImageUrl() {
        switch self.viewModel.sections[0].rows[0] {
        case .headerImage(let url):
            XCTAssertEqual(url.absoluteString, "http://www.test.com/300x300bb.jpg")
            
        default:
            XCTFail()
        }
    }
    
    func testLinkUrl() {
        switch self.viewModel.sections[0].rows[2] {
        case .actionButton(let title, let findOutMoreUrl):
            XCTAssertEqual(findOutMoreUrl.absoluteString, "http://www.test.com/1")
            
        default:
            XCTFail()
        }
    }
    
    func testNavigationTitle() {
        XCTAssertEqual(self.viewModel.navigationTitle, "Shake it off")
    }
}
