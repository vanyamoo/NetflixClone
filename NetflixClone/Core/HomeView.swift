//
//  HomeView.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 16/10/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var filters = FilterModel.mockFilters
    @State private var selectedFilter: FilterModel?
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                header
                    .padding()
                
                FilterBarView(
                    filters: filters,
                    selectedFilter: selectedFilter) {
                        selectedFilter = nil
                    } onFilterPressed: { newFilter in
                        selectedFilter = newFilter
                    }
                    .padding(.top, 16)
                
                Spacer()
                
            }
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("For Terry")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        //
                    }
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        //
                    }
            }
            .font(.title2)
        }
    }
    
}

#Preview {
    HomeView()
}
