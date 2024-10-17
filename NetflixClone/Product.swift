//
//  Product.swift
//  SpotifyClone
//
//  Created by Vanya Mutafchieva on 08/10/2024.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let images: [String]
    let thumbnail: String
    let brand: String?
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    static var mock: Product {
        Product(
            id: 123,
            title: "Example Product Title",
            description: "This is some mock product description that goes here",
            price: 999,
            discountPercentage: 15,
            rating: 4.5,
            stock: 50,
            images: [Constants.randomImage, Constants.randomImage, Constants.randomImage],
            thumbnail: Constants.randomImage,
            brand: "Apple"
        )
    }
}

struct ProductRow: Identifiable {
    let title: String
    let products: [Product]
    var id = UUID()
}
