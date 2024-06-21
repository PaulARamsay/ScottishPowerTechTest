//
//  RockTrackDetailsViewModel.swift
//  ScottishPowerTechnicalTest
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation

protocol RockTrackDetailsViewModeling {
    var sections: [RockTrackDetailsViewModel.Section] { get set }
    var navigationTitle: String { get }
}

class RockTrackDetailsViewModel: ObservableObject, RockTrackDetailsViewModeling {
        
    // MARK: - Properties (Public)
    
    var navigationTitle: String { self.selectedTrack.trackName }
    @Published var sections: [Section]
    
    // MARK: - Properties (Private)
    
    var selectedTrack: TracksListResponse.Track
    
    // MARK: Initializer
    
    init(selectedTrack: TracksListResponse.Track) {
        self.selectedTrack = selectedTrack
        self.sections = [
            .init(rows: [
                .headerImage(imageUrl: self.selectedTrack.modifiedImageUrlWith(size: 300)),
                .about(trackName: self.selectedTrack.trackName,
                       artist: self.selectedTrack.artistName,
                       price: self.selectedTrack.trackPrice.formattedAmount(),
                       duration: self.selectedTrack.trackTimeFormatted,
                       durationAccessibilityLabel: self.selectedTrack.trackTimeAccessibilityLabel,
                       releaseDate: self.selectedTrack.releaseDateFormatted),
                .actionButton(buttonTitle: "See more details", findOutMoreUrl: self.selectedTrack.trackViewUrl)
            ])
        ]
    }
}

// MARK: - View Configuration

extension RockTrackDetailsViewModel {
    
    struct Section {
        var rows: [Row]
    }
    
    enum Row {
        case headerImage(imageUrl: URL)
        case about(trackName: String, artist: String, price: String, duration: String, durationAccessibilityLabel: String, releaseDate: String)
        case actionButton(buttonTitle: String, findOutMoreUrl: URL)
    }
}

// MARK: - Hashable Conformance

extension RockTrackDetailsViewModel.Section: Hashable {}
extension RockTrackDetailsViewModel.Row: Hashable {}
