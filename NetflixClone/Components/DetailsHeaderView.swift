//
//  DetailsHeaderView.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 21/10/2024.
//

import SwiftUI
import SwiftfulUI

struct DetailsHeaderView: View {
    
    var imageName = Constants.randomImage
    var progress = 0.2
    var onAirplayPressed: (() -> Void)?
    var onXMarkPressed: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
                //.frame(maxWidth: .infinity, maxHeight: 240)
            CustomProgressBar(
                selection: progress,
                range: 0...1,
                backgroundColor: .netflixLightGray,
                foregroundColor: .netflixRed,
                cornerRadius: 2,
                height: 4
            )
            .padding(.bottom, 4)
            .animation(.linear, value: progress)
            
        }
        .aspectRatio(2, contentMode: .fit)
        .overlay(alignment: .topTrailing) {
            detailsHeaderButtons
        }
    }
    
    private var detailsHeaderButtons: some View {
        
            HStack(spacing: 8) {
                Circle()
                    .fill(.netflixGray)
                    .overlay {
                        Image(systemName: "tv.badge.wifi")
                            .foregroundStyle(.netflixWhite)
                    }
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        onAirplayPressed?()
                    }
                
                Circle()
                    .fill(.netflixGray)
                    .overlay {
                        Image(systemName: "xmark")
                            .foregroundStyle(.netflixWhite)
                    }
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        onXMarkPressed?()
                    }
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .padding()
        
    }
    
}

#Preview {
    DetailsHeaderView()
}
