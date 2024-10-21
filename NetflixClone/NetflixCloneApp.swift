//
//  NetflixCloneApp.swift
//  NetflixClone
//
//  Created by Vanya Mutafchieva on 16/10/2024.
//

import SwiftUI
import SwiftfulRouting

@main
struct NetflixCloneApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                HomeView()
            }
        }
    }
}
