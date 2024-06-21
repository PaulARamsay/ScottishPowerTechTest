//
//  RockTracksViewModelTests.swift
//  Scottish Power Tech TestTests
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation

import XCTest
@testable import ScottishPowerTechnicalTest
class RockTracksViewModelTests: XCTestCase {
    
    var viewModel: RockTracksListViewModel!
    var mockApiClient: MockMusicClient = .init()
    var tracks: [TracksListResponse.Track] = [
        .mock(),
        .mock(),
        .mock()
    ]
    
    override func setUpWithError() throws {
        self.viewModel = .init(apiClient: self.mockApiClient)
    }

    func testNumberOfSectionsAndRowsForStandardView() {
        self.mockApiClient.rockTrackListResult = .success([.mock(), .mock(), .mock()])
        self.viewModel.viewDidAppear()

        XCTAssertEqual(self.viewModel.sections.count, 3)
        
        XCTAssertEqual(self.viewModel.sections[0].rows.count, 1)
        XCTAssertEqual(self.viewModel.sections[1].rows.count, 1)
        XCTAssertEqual(self.viewModel.sections[2].rows.count, 1)
    }
    
    func testNumberOfSectionsRowsForErrorView() {
        self.mockApiClient.rockTrackListResult = .failure(reason: .decodeFailure)
        self.viewModel.viewDidAppear()

        XCTAssertEqual(self.viewModel.sections.count, 1)

        XCTAssertEqual(self.viewModel.sections[0].rows.count, 1)
    }
    
    func testViewDidFailToLoadDidTapRetry() {
        self.mockApiClient.rockTrackListResult = .failure(reason: .decodeFailure)
        self.viewModel.viewDidAppear()
        self.viewModel = .init(apiClient: self.mockApiClient)
        self.viewModel.viewDidAppear()
        
        XCTAssertEqual(self.viewModel.viewState, .error)
        let mockedTrack = TracksListResponse.Track.mock()
        
        self.mockApiClient.rockTrackListResult = .success([mockedTrack])
        self.viewModel.didTapRetry()
        XCTAssertEqual(self.viewModel.viewState, .displaying(tracks: [mockedTrack]))
    }
}
