//
//  InlineButtonView.swift
//  Scottish Power Tech Test
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation
import SwiftUI

struct NavigationLinkButton: View {
    
    @Environment(\.openURL) var openURL
    
    let buttonTitle: String
    let url: URL
    
    var body: some View{
        Button {
            self.openURL(self.url)
        } label: {
            HStack {
                Image(systemName: "square.and.arrow.up")
                Text(self.buttonTitle)
            }
        }

    }
}

#Preview {
    NavigationLinkButton(buttonTitle: "Let's go", url: URL(string: "http://www.google.com")!)
}

