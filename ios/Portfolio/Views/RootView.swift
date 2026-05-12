//
//  RootView.swift
//  Portfolio
//

import SwiftUI

struct RootView: View {
    @State private var path: [Project] = []
    @State private var showContact = false

    var body: some View {
        NavigationStack(path: $path) {
            HomeView(showContact: $showContact)
                .navigationDestination(for: Project.self) { project in
                    ProjectDetailView(project: project)
                }
        }
        .sheet(isPresented: $showContact) {
            ContactSheet()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
                .presentationBackground(Theme.background)
        }
    }
}
