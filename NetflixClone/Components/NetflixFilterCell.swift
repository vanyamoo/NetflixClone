//
//  NetflixFilterCell.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 16/10/2024.
//

import SwiftUI

struct NetflixFilterCell: View {
    
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
                if isSelected {
                    Capsule(style: .circular)
                        .fill(.netflixGray)
                }
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
            NetflixFilterCell(title: "TV Shows", isDropdown: false)
            NetflixFilterCell(title: "Movies", isDropdown: false, isSelected: true)
            NetflixFilterCell()
        }
    }
}
