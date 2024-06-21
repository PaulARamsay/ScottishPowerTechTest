//
//  Track+Extensions.swift
//  Scottish Power Tech TestTests
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation

import XCTest
@testable import ScottishPowerTechnicalTest
extension TracksListResponse.Track {
    
    static func mock() -> TracksListResponse.Track {
        return .init(artistName: "Taylor Swift",
                     trackName: "Shake it off",
                     trackPrice: .init(underlyingValue: 10.00),
                     artworkUrl60: URL(string: "http://www.test.com/1")!,
                     artworkUrl30: URL(string: "http://www.test.com/1")!,
                     releaseDate: Date(),
                     trackTimeMillis: 1221,
                     trackViewUrl: URL(string: "http://www.test.com/1")!)
    }
}
