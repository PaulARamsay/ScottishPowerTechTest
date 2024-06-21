//
//  DynamicImageView.swift
//  Scottish Power Tech Test
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation
import SwiftUI

struct DynamicImageView: View {
    
    let imageUrl: URL
    
    var body: some View {
        VStack {
            Spacer()
            AsyncImage(url: self.imageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 25))
            } placeholder: {
                ProgressView()
                    .scaledToFit()
            }
            Spacer()
        }
        
    }
}

#Preview {
    DynamicImageView(imageUrl: URL(string: "https://placehold.co/600x400")!)
}
