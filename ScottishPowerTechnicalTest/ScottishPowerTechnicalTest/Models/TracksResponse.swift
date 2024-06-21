//
//  Track.swift
//  ScottishPowerTechnicalTest
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation


struct TracksResponse: Decodable {
    
    let results: [Track]
    
    struct Track: Decodable, Equatable, Hashable {
        let artistName: String
        let trackName: String
        let trackPrice: Float
        let artworkUrl60: URL
        let artworkUrl30: URL
        let releaseDate: Date
        let trackTimeMillis: Int
        let trackViewUrl: URL
    }
}
