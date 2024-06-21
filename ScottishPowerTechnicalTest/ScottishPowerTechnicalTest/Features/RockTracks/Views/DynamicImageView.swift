//
//  DynamicImageView.swift
//  Scottish Power Tech Test
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation
import SwiftUI

// MARK: - View

struct DynamicImageView: View {
    
    // MARK: - Properties
    
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
                    .frame(width: 300, height: 300)
            }
            Spacer()
        }
    }
}

// MARK: - Preview

#Preview {
    List {
        DynamicImageView(imageUrl: URL(string: "https://placehold.co/600x400.jpg")!)
    }
}
