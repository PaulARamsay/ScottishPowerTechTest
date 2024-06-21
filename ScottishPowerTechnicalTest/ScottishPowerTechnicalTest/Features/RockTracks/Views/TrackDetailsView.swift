//
//  TrackDetailsView.swift
//  Scottish Power Tech Test
//
//  Created by Paul Ramsay on 21/06/2024.
//

import SwiftUI

struct TrackDetailsView: View {
    
    let trackName: String
    let artistName: String
    let price: String
    let duration: String
    let releaseDate: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(self.trackName)
                .font(.title)
            Text(self.artistName)
                .bold()
            Text(self.price)
            Text(self.duration)
                .padding(.top)
            Text(self.releaseDate)
        }
    }
}

#Preview {
    TrackDetailsView(trackName: "Twelve parsecs",
                     artistName: "Han Solo",
                     price: "3.55",
                     duration: "55 seconds",
                     releaseDate: "16/08/1995")
}
