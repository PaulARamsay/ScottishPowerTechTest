//
//  Track.swift
//  ScottishPowerTechnicalTest
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation


struct TracksListResponse: Decodable, Equatable, Hashable {
    
    let results: [Track]
    
    struct Track: Decodable, Equatable, Hashable {
        let artistName: String
        let trackName: String
        let trackPrice: CurrencyAmount
        let artworkUrl60: URL
        let artworkUrl30: URL
        let releaseDate: Date
        let trackTimeMillis: Int
        let trackViewUrl: URL
        
        /// Get a custom URL for a track image of any size
        /// - Parameter size: the width and height for the image track image URL.
        /// - Returns: a URL for the image.
        func modifiedImageUrlWith(size: Int) -> URL {
            let modifiedUrl = self.artworkUrl30.deletingLastPathComponent()
            return modifiedUrl.appendingPathComponent("\(size)x\(size)bb.jpg")
        }
        
        /// Returns the release date in a day, month, year format.
        var releaseDateFormatted: String {
            let preferredFormat = Date.FormatStyle()
                .day()
                .month()
                .year()
            return releaseDate.formatted(preferredFormat)
        }
        
        /// Returns the track time as a timeinterval
        private var trackTimeAsTimeInterval: TimeInterval {
            return TimeInterval(self.trackTimeMillis / 1000)
        }
        
        /// Returns the track time formated as `%02d:%02d` ie: 03:22
        var trackTimeFormatted: String {
            let timeDuration = self.trackTimeAsTimeInterval
            return String(timeDuration.formattedInMinutesSeconds)
        }
        
        /// Returns the track as a voiceover readable string eg: 3 minutes, 4 seconds
        var trackTimeAccessibilityLabel: String {
            let timeDuration = self.trackTimeAsTimeInterval
            let minutes = timeDuration.minute
            let seconds = timeDuration.second
            return String("\(minutes.pluralised(nonPluralForm: "minute", pluralForm: "minutes")), \(seconds.pluralised(nonPluralForm: "second", pluralForm: "seconds"))")
        }
        
    }
}
