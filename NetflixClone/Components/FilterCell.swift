//
//  FilterCell.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 16/10/2024.
//

import SwiftUI

struct FilterCell: View {
    
    var title = "Categories"
    var isDropdown = true
    var isSelected = false
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            if isDropdown {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            ZStack {
                //if isSelected {
                    Capsule(style: .circular)
                        .fill(.netflixGray)
                        .opacity(isSelected ? 1 : 0) // better to draw it on the screen instaed of the if isSelected... to get rid of teh bounciness
                //}
                Capsule(style: .circular)
                    .stroke(lineWidth: 1)
            }
        )
        .foregroundStyle(.netflixLightGray)
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        HStack {
            FilterCell(title: "TV Shows", isDropdown: false)
            FilterCell(title: "Movies", isDropdown: false, isSelected: true)
            FilterCell()
        }
    }
}
