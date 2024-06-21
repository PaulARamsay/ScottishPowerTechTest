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
    }
}
