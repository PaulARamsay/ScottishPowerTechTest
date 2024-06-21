//
//  TrackTests.swift
//  ScottishPowerTechnicalTestTests
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation
import XCTest

@testable import ScottishPowerTechnicalTest
class TrackTests: XCTestCase {
    
    let track = TracksListResponse.Track.mock()
    
    func testDidModifyUrlForSize() {
        XCTAssertEqual(self.track.modifiedImageUrlWith(size: 1234).absoluteString, "http://www.test.com/1234x1234bb.jpg")
    }
    
    func testDidFormatDate() {
        XCTAssertEqual(self.track.releaseDateFormatted, "15 Jan 2024")
    }
    
    func testTrackTimeFormatted() {
        XCTAssertEqual(self.track.trackTimeFormatted, "00:10")
    }
    
    func testTrackTimeAccessibilityLabel() {
        var track = TracksListResponse.Track.mock(trackTimeinMilliseconds: 1000)
        XCTAssertEqual(track.trackTimeAccessibilityLabel, "0 minutes, 1 second")
        
        track = TracksListResponse.Track.mock(trackTimeinMilliseconds: 62000)
        XCTAssertEqual(track.trackTimeAccessibilityLabel, "1 minute, 2 seconds")
    }
}

//
///// Get a custom URL for a track image of any size
///// - Parameter size: the width and height for the image track image URL.
///// - Returns: a URL for the image.
//func modifiedImageUrlWith(size: Int) -> URL {
//    let modifiedUrl = self.artworkUrl30.deletingLastPathComponent()
//    return modifiedUrl.appendingPathComponent("\(size)x\(size)bb.jpg")
//}
//
///// Returns the release date in a day, month, year format.
//var releaseDateFormatted: String {
//    let preferredFormat = Date.FormatStyle()
//        .day()
//        .month()
//        .year()
//    return releaseDate.formatted(preferredFormat)
//}
//
///// Returns the track time as a timeinterval
//private var trackTimeAsTimeInterval: TimeInterval {
//    return TimeInterval(self.trackTimeMillis / 1000)
//}
//
///// Returns the track time formated as `%02d:%02d` ie: 03:22
//var trackTimeFormatted: String {
//    let timeDuration = self.trackTimeAsTimeInterval
//    return String(timeDuration.formattedInMinutesSeconds)
//}
//
///// Returns the track as a voiceover readable string eg: 3 minutes, 4 seconds
//var trackTimeAccessibilityLabel: String {
//    let timeDuration = self.trackTimeAsTimeInterval
//    let minutes = timeDuration.minute
//    let seconds = timeDuration.second
//    return String("\(minutes.pluralised(nonPluralForm: "minute", pluralForm: "minutes")), \(seconds.pluralised(nonPluralForm: "second", pluralForm: "seconds"))")
//}
