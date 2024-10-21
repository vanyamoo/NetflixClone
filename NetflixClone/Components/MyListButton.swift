//
//  MyListButton.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 21/10/2024.
//

import SwiftUI

struct MyListButton: View {
    
    var isInMyList = false
    var onButtonPressed: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Image(systemName: "checkmark")
                    .opacity(isInMyList ? 1 : 0)
                    .rotationEffect(Angle(degrees: isInMyList ? 0 : 180))
                
                Image(systemName: "plus")
                    .opacity(isInMyList ? 0 : 1)
                    .rotationEffect(Angle(degrees: isInMyList ? -180 : 0))
            }
            .font(.title)
            
            Text("My List")
                .font(.caption)
                .foregroundStyle(.netflixLightGray)
        }
        .foregroundStyle(.netflixWhite)
        .padding()
        .animation(.bouncy, value: isInMyList)
        .onTapGesture {
            onButtonPressed?()
        }
    }
}

fileprivate struct MyListButtonPreview: View {
    
    @State private var isInMyList = false
    
    var body: some View {
        MyListButton(isInMyList: isInMyList) {
            isInMyList.toggle()
        }
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        MyListButtonPreview()
    }
}
