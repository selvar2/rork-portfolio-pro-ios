//
//  RootView.swift
//  Portfolio
//

import SwiftUI

struct RootView: View {
    @State private var showContact = false

    var body: some View {
        NavigationView {
            HomeView(showContact: $showContact)
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showContact) {
            contactSheet
        }
    }

    @ViewBuilder
    private var contactSheet: some View {
        if #available(iOS 16.4, *) {
            ContactSheet()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
                .presentationBackground(Theme.background)
        } else if #available(iOS 16.0, *) {
            ContactSheet()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        } else {
            ContactSheet()
        }
    }
}
