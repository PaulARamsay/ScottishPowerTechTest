//
//  RockTrackDetailsView.swift
//  ScottishPowerTechnicalTest
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation
import SwiftUI

// MARK: - View

struct RockTrackDetailsView: View {
    
    // MARK: - Properties (Private)
    
    @ObservedObject var viewModel: RockTrackDetailsViewModel
    
    // MARK: - Initializer
    
    init(viewModel: RockTrackDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View
    
    var body: some View {
        VStack {
            List {
                ForEach(self.viewModel.sections, id: \.self) { section in
                    self.viewForSection(section)
                }
            }
        }
        .navigationTitle(self.viewModel.navigationTitle)
    }
    
    // MARK: - ViewBuilders
    
    @ViewBuilder
    func viewForSection(_ section: RockTrackDetailsViewModel.Section) -> some View {
        Section {
            ForEach(section.rows, id: \.self) { row in
                self.viewForRow(row)
            }
        }
    }
    
    @ViewBuilder
    func viewForRow(_ row: RockTrackDetailsViewModel.Row) -> some View {
        switch row {
        case .about(let trackName, let artistName, let price, let duration, let durationAccessibilityLabel, let releaseDate):
            TrackDetailsView(trackName: trackName, artistName: artistName, price: price, duration: duration, durationAccessibilityLabel: durationAccessibilityLabel, releaseDate: releaseDate)

        case .headerImage(let imageUrl):
            DynamicImageView(imageUrl: imageUrl)
            
        case .actionButton(let buttonTitle, let url):
            NavigationLinkButton(buttonTitle: buttonTitle, url: url)
        }
    }
}

// MARK: - Preview

#Preview {
    RockTrackDetailsView(viewModel: .init(selectedTrack: .init(artistName: "Darth Vadar",
                                                               trackName: "Han Solo, shot first",
                                                               trackPrice: .init(underlyingValue: 20.00),
                                                               artworkUrl60: URL(string: "https://placehold.co/400x400")!,
                                                               artworkUrl30: URL(string: "https://placehold.co/400x400")!,
                                                               releaseDate: Date(),
                                                               trackTimeMillis: 1000,
                                                               trackViewUrl: URL(string: "https://www.google.com")!)))
}
