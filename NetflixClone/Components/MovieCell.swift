//
//  MovieCell.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 18/10/2024.
//

import SwiftUI

struct MovieCell: View {
    
    var width: CGFloat = 90
    var height: CGFloat = 140
    var imageName = Constants.randomImage
    var title = "Forrest Gump"
    var isRecentlyAdded = true
    var topTenRanking: Int?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
                .frame(width: width, height: height)
            
            VStack(spacing: 2) {
                movieTitle
                recentlyAdded
            }
            .frame(maxWidth: width)
            .background(LinearGradient(colors: [.netflixBlack.opacity(0.005), .netflixBlack.opacity(0.2), .netflixBlack.opacity(0.2)], startPoint: .top, endPoint: .bottom))
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var movieTitle: some View {
        Text(title)
            .font(.caption)
            .lineLimit(1)
            .shadow(radius: 4)
    }
    
    private var recentlyAdded: some View {
        Text("Recently Added")
            .font(.system(size: 8))
            .padding(.vertical, 2)
            .padding(.horizontal ,8)
            .background(.netflixRed)
            .cornerRadius(4)
            .opacity(isRecentlyAdded ? 1 : 0)
    }
}

#Preview {
    MovieCell()
}
