//
//  RockTracksListView.swift
//  ScottishPowerTechnicalTest
//
//  Created by Paul Ramsay on 21/06/2024.
//

import SwiftUI

struct RockTracksListView: View {
    
    // MARK: - Properties (Public)
    
    @ObservedObject var viewModel: RockTracksListViewModel
    
    // MARK: - Initialiser
    
    init(viewModel: RockTracksListViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.viewModel.sections, id: \.self) { section in
                        self.viewForSection(section)
                    }
                }
            }
            .navigationTitle(self.viewModel.navigationTitle)
            .onAppear(perform: {
                self.viewModel.viewDidAppear()
            })
        }
    }
    
    // MARK: - View Builders
    
    @ViewBuilder
    private func viewForSection(_ section: RockTracksListViewModel.Section) -> some View {
        Section {
            ForEach(section.rows, id: \.self) { row in
                self.viewForRow(row)
            }
        }
    }
    
    @ViewBuilder
    private func viewForRow(_ row: RockTracksListViewModel.Row) -> some View {
        switch row {
        case .loading:
            LoadingView()
            
        case .track(let imageUrl, let trackName, let artistName, let price, let thisTrack):
            NavigationLink {
                NavigationDestination.trackDetails(thisTrack).associatedView()
            } label: {
                TrackView(imageUrl: imageUrl, trackName: trackName, artistName: artistName, price: price)
            }
            
        case .unableToLoadTracksList(let bodyText, let systemImage, let buttonTitle):
            ErrorView(bodyText: bodyText, systemImageName: systemImage, buttonTitle: buttonTitle) {
                self.viewModel.didTapRetry()

            }
        }
    }
}

// MARK: - Previews

#Preview {
    RockTracksListView(viewModel: .init())
}
