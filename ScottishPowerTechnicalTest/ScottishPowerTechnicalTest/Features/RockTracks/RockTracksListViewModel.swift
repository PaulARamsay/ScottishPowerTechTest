//
//  RockTracksListViewModel.swift
//  ScottishPowerTechnicalTest
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation

class RockTracksListViewModel: ObservableObject {
    
    // MARK: - Properties (Public)
        
    var viewState: RockTracksListViewModel.ViewState
    @Published var sections: [Section] = []
    
    // MARK: Initializer
    
    init() {
        self.viewState = .downloadingTrackList
    }
}

// MARK: - View Configuration

extension RockTracksListViewModel {
    
    struct Section {
        var rows: [Row]
    }
    
    enum Row {
        case loading
        case unableToLoadTracksList(bodyText: String, systemImageName: String, buttonTitle: String)
        case track(imageUrl: URL, trackName: String, artistName: String, price: String, track: TracksResponse.Track)
    }
    
    
    enum ViewState: Equatable {
        case error
        case downloadingTrackList
        case displaying(tracks: [TracksResponse.Track])
    }
}
