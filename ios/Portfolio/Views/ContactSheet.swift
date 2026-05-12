//
//  ContactSheet.swift
//  Portfolio
//

import SwiftUI

struct ContactSheet: View {
    @Environment(\.dismiss) private var dismiss
    private let profile = PortfolioContent.profile

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Contact".uppercased())
                        .font(.eyebrow)
                        .tracking(1.4)
                        .foregroundStyle(Theme.accent)
                    Text("Let's talk.")
                        .font(.display)
                        .foregroundStyle(Theme.textPrimary)
                    Text("Best for senior iOS roles, design-engineering hybrid work, or substantive contract projects.")
                        .font(.bodyRefined)
                        .foregroundStyle(Theme.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 2)
                }

                VStack(spacing: 10) {
                    ContactRow(icon: "envelope", label: "Email", value: profile.email,
                               url: URL(string: "mailto:\(profile.email)"))
                    ContactRow(icon: "link", label: "Website", value: profile.website,
                               url: URL(string: "https://\(profile.website)"))
                    ContactRow(icon: "chevron.left.forwardslash.chevron.right", label: "GitHub", value: profile.github,
                               url: URL(string: "https://\(profile.github)"))
                    ContactRow(icon: "person.crop.square", label: "LinkedIn", value: profile.linkedin,
                               url: URL(string: "https://\(profile.linkedin)"))
                }
                .padding(.top, 4)

                Spacer().frame(height: 24)
            }
            .padding(.horizontal, Theme.hPadding)
            .padding(.top, 12)
        }
        .scrollIndicators(.hidden)
    }
}

private struct ContactRow: View {
    let icon: String
    let label: String
    let value: String
    let url: URL?

    var body: some View {
        Link(destination: url ?? URL(string: "https://example.com")!) {
            HStack(spacing: 14) {
                Image(systemName: icon)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(Theme.accent)
                    .frame(width: 34, height: 34)
                    .background(Circle().fill(Theme.accentSoft))
                VStack(alignment: .leading, spacing: 2) {
                    Text(label)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(Theme.textTertiary)
                    Text(value)
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(Theme.textPrimary)
                        .lineLimit(1)
                        .truncationMode(.middle)
                }
                Spacer()
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(Theme.textTertiary)
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: Theme.rMd, style: .continuous)
                    .fill(Theme.surface)
            )
            .overlay(
                RoundedRectangle(cornerRadius: Theme.rMd, style: .continuous)
                    .strokeBorder(Theme.hairline, lineWidth: 1)
            )
        }
        .buttonStyle(PressableStyle())
    }
}
