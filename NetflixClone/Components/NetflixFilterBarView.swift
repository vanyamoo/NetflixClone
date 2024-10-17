//
//  NetflixFilterBarView.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 17/10/2024.
//

import SwiftUI

struct FilterModel: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    static var mockFilters: [FilterModel] {
        [
            FilterModel(title: "TV Shows", isDropdown: false),
            FilterModel(title: "Movies", isDropdown: false),
            FilterModel(title: "Categories", isDropdown: true)
        ]
    }
}

struct NetflixFilterBarView: View {
    
    var onXMarkPressed: (() -> Void)?
    var filters: [FilterModel] = FilterModel.mockFilters
    @State private var selectedFilter: FilterModel?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                        )
                        .foregroundStyle(.netflixLightGray)
                        .padding(.vertical, 4)
                        .onTapGesture {
                            //onXMarkPressed?()
                            selectedFilter = nil
                        }
                        .transition(AnyTransition.move(edge: .leading))
                        .padding(.leading, 16)
                }
                
                ForEach(filters, id: \.self) { filter in
                    NetflixFilterCell(title: filter.title, isDropdown: filter.isDropdown, isSelected: filter == selectedFilter)
                        .onTapGesture {
                            selectedFilter = filter
                        }
                        .padding(.leading, ((selectedFilter == nil) && filter == filters.first) ? 16 : 0)
                }
            }
            //.padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        NetflixFilterBarView()
    }
}
