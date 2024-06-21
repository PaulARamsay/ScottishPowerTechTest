//
//  RockTracksListViewModel.swift
//  ScottishPowerTechnicalTest
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation

class RockTracksListViewModel: ObservableObject {
        
    // MARK: - Properties (Public)
    
    var navigationTitle: String { "Rock Tracks " }
    @Published var sections: [RockTracksListViewModel.Section] = []
    
    // MARK: - Properties (Private)
        
    var viewState: ViewState {
        didSet {
            DispatchQueue.main.async{
                self.updateViewState()
            }
        }
    }
            
    // MARK: Initializer
    
    init() {
        self.viewState = .downloadingTrackList
    }
    
    // MARK: - Public
    
    func viewDidAppear() {
        self.downloadViewState()
    }
    
    func didTapRetry() {
        self.downloadViewState()
    }
    
    // MARK: - Private
    
    private func downloadViewState() {
        self.viewState = .displaying(tracks: [.init(artistName: "1", trackName: "2", trackPrice: 10.00, artworkUrl60: URL(string: "https://www.google.com")!, artworkUrl30: URL(string: "https://www.google.com")!, releaseDate: Date(), trackTimeMillis: 1000, trackViewUrl: URL(string: "https://www.google.com")!)])
    }
    
    private func updateViewState() {
        switch self.viewState {
        case .downloadingTrackList:
            self.sections = [
                .init(rows: [
                    .loading
                ])
            ]

        case .displaying(let tracks):
            self.sections = [
                .init(rows: tracks.compactMap {
                    .track(imageUrl: $0.artworkUrl30, trackName: $0.trackName, artistName: $0.artistName, price: $0.trackPrice.description, track: $0)
                })
            ]
            
        case .error:
            self.sections = [
                .init(rows: [
                    .unableToLoadTracksList(bodyText: "Oh no, something went wrong. Please retry",
                                            systemImageName: "info.circle",
                                            buttonTitle: "Retry")
                ])
            ]
        }
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

// MARK: - Hashable Conformance

extension RockTracksListViewModel.Section: Hashable {}
extension RockTracksListViewModel.Row: Hashable {}

