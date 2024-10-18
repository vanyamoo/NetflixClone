//
//  HomeView.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 16/10/2024.
//

import SwiftUI
import SwiftfulUI

struct HomeView: View {
    
    @State private var filters = FilterModel.mockFilters
    @State private var selectedFilter: FilterModel?
    @State private var fullHeaderSize: CGSize = .zero
    @State private var heroProduct: Product?
    @State private var currentUser: User?
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 8) {
                    blankCellBehindHeader
                    
                    if let heroProduct {
                        HeroCell(
                            imageName: heroProduct.firstImage,
                            isNetflixFilm: true,
                            title: heroProduct.title,
                            genres: [],
                            onBackgroundPressed: {
                                //
                            }, onPlayPressed: {
                                //
                            }, onMyListPressed: {
                                //
                            }
                        )
                        .padding(24)
                    }
                    
                    ForEach(0...20) { _ in
                        Rectangle()
                            .fill(.red)
                            .frame(height: 200)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                filterBar
            }
            .background(.blue)
            .readingFrame { frame in
                fullHeaderSize = frame.size
            }
        }
        .task {
            await getData()
        }
        .foregroundStyle(.netflixWhite)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
            //guard products.isEmpty else { return }
            do {
                currentUser = try await DatabaseHelper().getUsers().first
                let products = try await DatabaseHelper().getProducts()
                heroProduct = products.first
               
                var rows: [ProductRow] = []
                let allBrands = Set(products.map({ $0.brand ?? "Brand goes here"})) // Set so we don't have duplicates
                for brand in allBrands {
                    //let products = products.filter({ $0.brand == brand })
                    rows.append(ProductRow(title: brand, products: products))
                }
                productRows = rows
            } catch {
                print(error.localizedDescription)
            }
        }
    
    private var blankCellBehindHeader: some View {
        Rectangle()
            .opacity(0)
            .frame(height: fullHeaderSize.height)
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
    
    private var filterBar: some View {
        FilterBarView(
            filters: filters,
            selectedFilter: selectedFilter) {
                selectedFilter = nil
            } onFilterPressed: { newFilter in
                selectedFilter = newFilter
            }
            .padding(.top, 16)
    }
    
}

#Preview {
    HomeView()
}
