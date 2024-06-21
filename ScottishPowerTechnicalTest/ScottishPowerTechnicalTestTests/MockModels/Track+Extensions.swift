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
    
    static func mock(trackPrice: CurrencyAmount = .init(underlyingValue: 10.00),
                     trackTimeinMilliseconds: Int = 10000) -> TracksListResponse.Track {
        return .init(artistName: "Taylor Swift",
                     trackName: "Shake it off",
                     trackPrice: trackPrice,
                     artworkUrl60: URL(string: "http://www.test.com/1")!,
                     artworkUrl30: URL(string: "http://www.test.com/1")!,
                     releaseDate: Date.init(timeIntervalSince1970: 1705353909),
                     trackTimeMillis: trackTimeinMilliseconds,
                     trackViewUrl: URL(string: "http://www.test.com/1")!)
    }
}
