//
//  LoadingView.swift
//  Scottish Power Tech Test
//
//  Created by Paul Ramsay on 20/06/2024.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                ProgressView()
                Spacer()
            }
        }
    }
}

#Preview {
    List {
        LoadingView()
    }
}
