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
        HStack {
            
            chartRanking
            
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
            .cornerRadius(6)
        }
    }
    
    @ViewBuilder
    private var chartRanking: some View {
        if let topTenRanking {
                Text("\(topTenRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(x: 15, y: 30)
                    .foregroundStyle(.netflixWhite)
        }
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
            .padding(.bottom, 2)
            .background(.netflixRed)
            .cornerRadius(4)
            .offset(y: 2)
            .minimumScaleFactor(0.1)
            .opacity(isRecentlyAdded ? 1 : 0)
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        VStack {
            Text("Based on Books")
                .fontWeight(.semibold)
                .foregroundStyle(.netflixWhite)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack() {
                    MovieCell(isRecentlyAdded: false)
                    MovieCell()
                    MovieCell(isRecentlyAdded: false)
                    MovieCell(isRecentlyAdded: false)
                }
            }
            
            Text("Top 10 Chart")
                .fontWeight(.semibold)
                .foregroundStyle(.netflixWhite)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack() {
                    MovieCell(isRecentlyAdded: false, topTenRanking: 1)
                    MovieCell(topTenRanking: 2)
                    MovieCell(isRecentlyAdded: false, topTenRanking: 3)
                    MovieCell(isRecentlyAdded: false, topTenRanking: 4)
                    MovieCell(isRecentlyAdded: true, topTenRanking: 10)
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding()
    }
}
