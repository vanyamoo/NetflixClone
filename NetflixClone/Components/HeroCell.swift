//
//  HeroCell.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 17/10/2024.
//

import SwiftUI
import SwiftfulUI

struct HeroCell: View {
    
    var imageName = Constants.randomImage
    var isNetflixFilm = true
    var title = "Emily in Paris"
    var genres = ["Raunchy", "Romantic", "Comedy"]
    var onBackgroundPressed: (() -> Void)?
    var onPlayPressed: (() -> Void)?
    var onMyListPressed: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            
            VStack {
                
                netflixFilm
                
                filmTitle
                
                genresList
                
                HStack(spacing: 16) {
                    play
                    myList
                }
            }
            .padding(32)
            .background(LinearGradient(colors: [.netflixBlack.opacity(0.005), .netflixBlack.opacity(0.2), .netflixBlack.opacity(0.4)], startPoint: .top, endPoint: .bottom))
        }
        .cornerRadius(10)
        .aspectRatio(0.8, contentMode: .fit)
        .asButton(.tap) {
            onBackgroundPressed?()
        }
    }
    
    private var netflixFilm: some View {
        HStack(spacing: 8) {
            Text("N")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.netflixRed)
            
            Text("FILM")
                .kerning(3)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.netflixLightGray)
        }
        .opacity(isNetflixFilm ? 1 : 0)
    }
    
    private var filmTitle: some View {
        Text(title)
            .font(.system(size: 45, weight: .medium, design: .serif))
            .multilineTextAlignment(.center)
            .lineLimit(3)
            .foregroundStyle(.netflixWhite)
            .shadow(radius: 4)
    }
    
    private var genresList: some View {
        HStack {
            ForEach(genres, id:\.self) { genre in
                HStack {
                    Text(genre)
                        .font(.callout)
                        .fontWeight(.medium)
                        .lineLimit(3)
                        
                    
                    Circle()
                        .frame(width: 5)
                        .opacity(genres.last == genre ? 0 : 1)
                }
                .foregroundStyle(.netflixWhite)
                .shadow(radius: 4)
            }
        }
    }
    
    private var play: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.netflixWhite)
            .overlay {
                HStack(spacing: 4) {
                    Image(systemName: "play.fill")
                    Text("Play")
                }
                .foregroundStyle(.netflixGray)
                .fontWeight(.semibold)
            }
            .frame(width: 130, height: 36)
            .asButton {
                onPlayPressed?()
            }
    }
    
    private var myList: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.netflixGray)
            .overlay {
                HStack(spacing: 4) {
                    Image(systemName: "plus")
                    Text("My List")
                }
                .foregroundStyle(.netflixWhite)
                .fontWeight(.semibold)
            }
            .frame(width: 130, height: 36)
            .asButton {
                onMyListPressed?()
            }
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        HeroCell()
            .padding(40)
    }
}
