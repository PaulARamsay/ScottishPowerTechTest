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
            
    var viewState: ViewState {
        didSet {
            DispatchQueue.main.async{
                self.updateViewState()
            }
        }
    }
    
    // MARK: - Properties (Private)
    
    private let apiClient: MusicApiClient
            
    // MARK: Initializer
    
    init(apiClient: MusicApiClient = MusicClient()) {
        self.apiClient = apiClient
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
        self.viewState = .downloadingTrackList
        
        self.apiClient.rockTrackList { result in
            switch result {
            case .success(let tracks):
                let tracksSorted = tracks.sorted { firstTrack, secondTrack in
                    firstTrack.releaseDate < secondTrack.releaseDate
                }
                
                self.viewState = .displaying(tracks: tracksSorted)
                
            case .failure:
                self.viewState = .error
            }
        }
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
            self.sections = tracks.compactMap {
                .init(rows: [
                    .track(imageUrl: $0.modifiedImageUrlWith(size: 100),
                           trackName: $0.trackName,
                           artistName: $0.artistName,
                           price: $0.trackPrice.formattedAmount(),
                           track: $0)
                ])
            }
            
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
        case track(imageUrl: URL, trackName: String, artistName: String, price: String, track: TracksListResponse.Track)
    }
    
    enum ViewState: Equatable {
        case error
        case downloadingTrackList
        case displaying(tracks: [TracksListResponse.Track])
    }
}

// MARK: - Hashable Conformance

extension RockTracksListViewModel.Section: Hashable {}
extension RockTracksListViewModel.Row: Hashable {}

