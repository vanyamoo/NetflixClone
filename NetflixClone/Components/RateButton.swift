//
//  RateButton.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 21/10/2024.
//

import SwiftUI

enum RateOption: String, CaseIterable {
    case dislike, like, love
    
    var title: String {
        switch self {
        case .dislike:
            return "Not for me"
        case .like:
            return "I like this"
        case .love:
            return "Love this!"
        }
    }
    
    var iconName: String {
        switch self {
        case .dislike:
            return "hand.thumbsdown"
        case .like:
            return "hand.thumbsup"
        case .love:
            return "bolt.heart"
        }
    }
}

struct RateButton: View {
    
    @State private var showPopover = false
    var onRatingSelected: ((RateOption) -> Void)?
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "hand.thumbsup")
                .font(.title)
            
            Text("Rate")
                .font(.caption)
                .foregroundStyle(.netflixLightGray)
        }
        .foregroundStyle(.netflixWhite)
        .padding()
        .onTapGesture {
            showPopover.toggle()
        }
        .popover(isPresented: $showPopover) {
            ZStack {
                Color.netflixGray.ignoresSafeArea()
                
                HStack(spacing: 12) {
                    ForEach(RateOption.allCases, id: \.self) { option in
                        rateButton(option: option)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .presentationCompactAdaptation(.popover)
        }
    }
    
    private func rateButton(option: RateOption) -> some View {
        VStack(spacing: 8) {
            Image(systemName: option.iconName)
                .font(.title2)
            Text(option.title)
                .font(.caption)
        }
        .foregroundStyle(.netflixWhite)
        .padding(4)
        .onTapGesture {
            showPopover = false
            onRatingSelected?(option)
        }
    }
    
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        RateButton()
    }
}
