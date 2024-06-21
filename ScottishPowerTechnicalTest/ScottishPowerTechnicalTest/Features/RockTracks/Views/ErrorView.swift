//
//  ErrorView.swift
//  Scottish Power Tech Test
//
//  Created by Paul Ramsay on 20/06/2024.
//

import SwiftUI

// MARK: - View

struct ErrorView: View {
    
    let bodyText: String
    let systemImageName: String
    let buttonTitle: String
    let didTapRetry: () -> Void
    
    // MARK: - View Body
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
                Image(systemName: self.systemImageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(Color.accentColor)
                    .frame(width: 50, height: 50)
                Text(self.bodyText)
                Button(self.buttonTitle, action: self.didTapRetry)
                  .buttonStyle(.bordered)
            }
            Spacer()
        }
    }
}

// MARK: - Preview

#Preview {
    List {
        ErrorView(bodyText: "Preview body", 
                  systemImageName: "info.circle",
                  buttonTitle: "Button title",
                  didTapRetry: {})
    }
}
