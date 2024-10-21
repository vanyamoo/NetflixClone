//
//  MovieDetailsView.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 19/10/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var product: Product = .mock
    
    @State private var progress: Double = 0.2
    @State private var isInMyList = false
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                DetailsHeaderView(
                    imageName: product.firstImage,
                    progress: progress) {
                        //
                    } onXMarkPressed: {
                        //
                    }

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        detailsProductSection
                        
                        buttonsSection
                        
                        productsGridSection
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .padding()
        }
        .task {
            await getData()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    private var detailsProductSection: some View {
        DetailsProductView(
            title: product.title,
            isNew: true,
            yearReleased: "2024",
            seasonCount: 4,
            hasClosedCaptions: true,
            isTopTen: 6,
            descriptionText: product.description,
            castText: "Cast: Tom Hanks, Robin Right, Sally Field") {
                //
            } onDownloadPressed: {
                //
            }
    }
    
    private var buttonsSection: some View {
        HStack(spacing: 32) {
            MyListButton(isInMyList: isInMyList) {
                isInMyList.toggle()
            }
            
            RateButton { selection in
                // do something with selection
            }
            
            ShareButton()
        }
        .padding(.leading, 32)
    }
    
    private var productsGridSection: some View {
        VStack(alignment: .leading) {
            Text("More Like This")
                .font(.headline)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3), spacing: 8) {
                ForEach(products) { product in
                    MovieCell(
                        imageName: product.firstImage,
                        title: product.title,
                        isRecentlyAdded: product.recentlyAdded,
                        topTenRanking: nil
                    )
                }
            }
                
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private func getData() async {
            guard products.isEmpty else { return }
            do {
                products = try await DatabaseHelper().getProducts()
            } catch {
                print(error.localizedDescription)
            }
        }
}

#Preview {
    MovieDetailsView()
}
