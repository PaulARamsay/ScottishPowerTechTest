//
//  NavigationLink+Extensions.swift
//  Scottish Power Tech Test
//
//  Created by Paul Ramsay on 20/06/2024.
//

import Foundation
import SwiftUI

enum NavigationDestination {

    case trackDetails(TracksListResponse.Track)
    
    @ViewBuilder
    func associatedView() -> some View {
        switch self {
        case .trackDetails(let track):
            RockTrackDetailsView(viewModel: .init(selectedTrack: track))
        }
    }
}

extension NavigationDestination: Hashable {}
