//
//  PortfolioApp.swift
//  Portfolio
//

import SwiftUI

@main
struct PortfolioApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .preferredColorScheme(.dark)
                .tint(Theme.accent)
        }
    }
}
