//
//  User.swift
//  SpotifyClone
//
//  Created by Vanya Mutafchieva on 08/10/2024.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height, weight: Double
    
    var work: String {
        "Architect"
    }
    
    var education: String {
        "Graduate Degree"
    }
    
    var aboutMe: String {
        "This is a sentence about me that will look good on my profile!"
    }
    
    var basicInfo: [User.UserInfo] {
        [
            User.UserInfo(info: "176", iconName: "ruler", emoji: nil, iconType: "systemImage"),
            User.UserInfo(info: "Graduate Degree", iconName: "graduationcap", emoji: nil, iconType: "systemImage"),
            User.UserInfo(info: "Socially", iconName: "wineglass", emoji: nil, iconType: "systemImage"),
            User.UserInfo(info: "Virgo", iconName: "moon.stars.fill", emoji: nil, iconType: "systemImage")
        ]
    }
    
    var interests: [User.UserInfo] {
        [
            User.UserInfo(info: "Running", iconName: nil, emoji: "👟", iconType: "emoji"),
            User.UserInfo(info: "Gym", iconName: nil, emoji: "🏋️‍♂️", iconType: "emoji"),
            User.UserInfo(info: "Music", iconName: nil, emoji: "🎧", iconType: "emoji"),
            User.UserInfo(info: "Cooking", iconName: nil, emoji: "🥘", iconType: "emoji")
        ]
    }
    
    var images: [String] {
        ["https://picsum.photos/500/500", "https://picsum.photos/600/600", "https://picsum.photos/700/700"]
    }
    var country: String { "🇺🇸" }
    
    var city: String {
        "New York"
    }
    var state: String {
        "NY"
    }
    var distance: Int { 10 }
    
    struct UserInfo: Hashable {
        var info: String
        var iconName: String?
        var emoji: String?
        var iconType: String
    }
    
    static var mock = User(
        id: 444,
        firstName: "Vanya",
        lastName: "Moo",
        maidenName: "",
        age: 34,
        email: "hi@hi.com",
        phone: "",
        username: "",
        password: "",
        image: Constants.randomImage,
        height: 170,
        weight: 55//,
        //education: "MArch",
        //occupation: "Architect"
    )
}

enum Icon: String, CaseIterable {
    case emoji
    case systemImage
}
