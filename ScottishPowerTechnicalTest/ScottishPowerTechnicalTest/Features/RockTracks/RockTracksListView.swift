//
//  RockTracksListView.swift
//  ScottishPowerTechnicalTest
//
//  Created by Paul Ramsay on 21/06/2024.
//

import SwiftUI

struct RockTracksListView: View {
    
    @ObservedObject var viewModel: RockTracksListViewModel
    
    init(viewModel: RockTracksListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Test")
    }
}

#Preview {
    RockTracksListView(viewModel: .init())
}
