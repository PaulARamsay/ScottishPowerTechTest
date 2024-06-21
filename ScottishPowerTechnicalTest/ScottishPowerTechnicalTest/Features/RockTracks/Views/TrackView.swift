//
//  TrackView.swift
//  Scottish Power Tech Test
//
//  Created by Paul Ramsay on 20/06/2024.
//

import SwiftUI

struct TrackView: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    let imageUrl: URL
    let trackName: String
    let artistName: String
    let price: String
    
    var body: some View {
        if self.sizeCategory > .large {
            VStack {
                self.mainContent
            }
        } else {
            HStack {
                self.mainContent
            }
        }
    }
    
    @ViewBuilder
    var mainContent: some View {
        AsyncImage(url: self.imageUrl) { image in
            image
                .frame(width: 100)
                .clipShape(.rect(cornerRadius: 25))
        } placeholder: {
            ProgressView()
                .frame(width: 100)
        }
        VStack(alignment: .leading) {
            Text(self.trackName)
                .padding(.top)
                .font(.headline)
            Text(self.artistName)
            Spacer()
            Text(self.price)
                .padding(.bottom)
                .font(.caption)
        }
    }
}

#Preview {
    List {
        TrackView(imageUrl: URL(string: "https://placehold.co/600x400")!,
                  trackName: "Tea Tea Tea",
                  artistName: "PG Tips",
                  price: "£10.00")
    }
}
