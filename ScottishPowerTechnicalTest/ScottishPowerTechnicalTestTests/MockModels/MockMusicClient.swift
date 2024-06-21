//
//  MockMusicClient.swift
//  Scottish Power Tech TestTests
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation

@testable import ScottishPowerTechnicalTest
class MockMusicClient: MusicApiClient {
    
    var rockTrackListResult: NetworkRequestResult<[TracksListResponse.Track]> = .success([.mock()])
    
    func rockTrackList(completion: (NetworkRequestResult<[TracksListResponse.Track]>) -> Void) {
        completion(self.rockTrackListResult)
    }
}
