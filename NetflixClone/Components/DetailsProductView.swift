//
//  DetailsProductView.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 21/10/2024.
//

import SwiftUI
import SwiftfulUI

struct DetailsProductView: View {
    
    var title = "Forrest Gump"
    var isNew = true
    var yearReleased: String? = "2024"
    var seasonCount: Int? = 2
    var hasClosedCaptions = true
    var isTopTen: Int? = 6
    var descriptionText: String? = "This is the description for the title that is selected and it should go multiple lines."
    var castText: String? = "Tom Hanks, Robin Right, Sally Field"
    var onPlayPressed: (() -> Void)?
    var onDownloadPressed: (() -> Void)?
    
    var body: some View {
        VStack {
            Group {
                Text(title)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                titleInfo
                    .foregroundStyle(.netflixLightGray)
                
                topTenRanking
                
                VStack {
                    play
                    download
                }
                
                if let descriptionText {
                    Text(descriptionText)
                }
                
                if let castText {
                    Text(castText)
                        .foregroundStyle(.netflixLightGray)
                }
            }
            .font(.callout)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
        }
        .padding(.top)
        .foregroundStyle(.netflixWhite)
    }
    
    private var play: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.netflixWhite)
            .overlay {
                HStack(spacing: 4) {
                    Image(systemName: "play.fill")
                    Text("Play").font(.callout)
                }
                //.frame(maxWidth: .infinity)
                .foregroundStyle(.netflixGray)
                .fontWeight(.medium)
            }
            .frame(height: 36)
            .asButton {
                onPlayPressed?()
            }
    }
    
    private var download: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.netflixGray)
            .overlay {
                HStack(spacing: 4) {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Download").font(.callout)
                }
                //.frame(maxWidth: .infinity)
                .foregroundStyle(.netflixWhite)
                .fontWeight(.medium)
            }
            .frame(height: 36)
            .asButton {
                onDownloadPressed?()
            }
    }
    
    private var topTenRanking: some View {
        HStack(spacing: 8) {
            if let isTopTen {
                topTenIcon
                
                Text("#\(isTopTen) in TV Shows Today")
                    .font(.headline)
            }
        }
    }
    
    private var titleInfo: some View {
        HStack(spacing: 8) {
            if isNew {
                Text("New")
                    .foregroundStyle(.green)
                if let yearReleased {
                    Text(yearReleased)
                }
            }
            
            if let seasonCount {
                Text("\(seasonCount) Seasons")
            }
            
            if hasClosedCaptions {
                Image(systemName: "captions.bubble")
            }
        }
    }
    
    private var topTenIcon: some View {
        VStack(spacing: -4) {
            Text("TOP")
                .font(.system(size: 8))
                .fontWeight(.bold)
            Text("10")
                .font(.system(size: 16))
                .fontWeight(.bold)
        }
        .padding(6)
        .offset(y: 1)
        .background(Rectangle().frame(width: 28, height: 28).foregroundStyle(.netflixRed))
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        DetailsProductView()
    }
}
