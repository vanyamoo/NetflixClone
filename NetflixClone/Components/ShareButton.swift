//
//  ShareButton.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 21/10/2024.
//

import SwiftUI

struct ShareButton: View {
    
    var url = "https://www.swiftful-thinking.com"
    
    var body: some View {
        if let url = URL(string: url) {
            ShareLink(item: url) {
                VStack(spacing: 8) {
                    Image(systemName: "paperplane")
                        .font(.title)
                    
                    Text("Share")
                        .font(.caption)
                        .foregroundStyle(.netflixLightGray)
                }
                .foregroundStyle(.netflixWhite)
                .padding()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        ShareButton()
    }
}
