//
//  NavigationLink+Extensions.swift
//  Scottish Power Tech Test
//
//  Created by Paul Ramsay on 20/06/2024.
//

import Foundation
import SwiftUI

enum NavigationDestination {

    /// Navigates to the RockTrackDetailsView screen
    case trackDetails(TracksListResponse.Track)
    
    @ViewBuilder
    func associatedView() -> some View {
        switch self {
        case .trackDetails(let track):
            RockTrackDetailsView(viewModel: .init(selectedTrack: track))
        }
    }
}

// MARK: - Hashable Conformance

extension NavigationDestination: Hashable {}
