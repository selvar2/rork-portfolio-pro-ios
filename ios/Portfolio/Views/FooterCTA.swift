//
//  FooterCTA.swift
//  Portfolio
//

import SwiftUI

struct FooterCTA: View {
    @Binding var showContact: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Let's build something\nworth shipping.")
                .font(.system(size: 28, weight: .semibold, design: .serif))
                .foregroundStyle(Theme.textPrimary)
                .lineSpacing(2)

            Text("Available for full-time roles and select contract work.")
                .font(.system(size: 14))
                .foregroundStyle(Theme.textSecondary)

            Button {
                showContact = true
            } label: {
                HStack(spacing: 8) {
                    Text("Reach out")
                        .font(.system(size: 15, weight: .semibold))
                    Image(systemName: "arrow.up.right")
                        .font(.system(size: 13, weight: .semibold))
                }
                .foregroundStyle(Theme.background)
                .padding(.horizontal, 18)
                .padding(.vertical, 13)
                .background(Capsule().fill(Theme.accent))
            }
            .buttonStyle(PressableStyle())
            .padding(.top, 4)
        }
        .padding(22)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: Theme.rLg, style: .continuous)
                .fill(Theme.surface)
        )
        .overlay(
            RoundedRectangle(cornerRadius: Theme.rLg, style: .continuous)
                .strokeBorder(Theme.hairline, lineWidth: 1)
        )
    }
}
