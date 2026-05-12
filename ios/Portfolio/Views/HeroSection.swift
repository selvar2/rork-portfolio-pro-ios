//
//  HeroSection.swift
//  Portfolio
//

import SwiftUI

struct HeroSection: View {
    let profile: Profile
    @Binding var showContact: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            // Status pill
            HStack(spacing: 8) {
                AvailabilityDot()
                Text("Available for senior iOS roles")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Theme.textSecondary)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 7)
            .background(
                Capsule().fill(Color.white.opacity(0.04))
            )
            .overlay(
                Capsule().strokeBorder(Theme.hairline, lineWidth: 1)
            )

            // Headline — serif, editorial
            VStack(alignment: .leading, spacing: 4) {
                Text(profile.name)
                    .font(.displayXL)
                    .foregroundStyle(Theme.textPrimary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.85)
                HStack(spacing: 8) {
                    Text(profile.role)
                        .font(.system(size: 17, weight: .medium))
                        .foregroundStyle(Theme.textSecondary)
                    Text("·")
                        .foregroundStyle(Theme.textTertiary)
                    Text(profile.location)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(Theme.textTertiary)
                }
            }

            Text(profile.intro)
                .font(.bodyRefined)
                .foregroundStyle(Theme.textSecondary)
                .lineSpacing(4)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 2)

            HStack(spacing: 10) {
                Button {
                    showContact = true
                } label: {
                    HStack(spacing: 8) {
                        Text("Get in touch")
                            .font(.system(size: 15, weight: .semibold))
                        Image(systemName: "arrow.up.right")
                            .font(.system(size: 13, weight: .semibold))
                    }
                    .foregroundStyle(Theme.background)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 13)
                    .background(
                        Capsule().fill(Theme.accent)
                    )
                }
                .buttonStyle(PressableStyle())

                Link(destination: URL(string: "https://\(profile.website)")!) {
                    HStack(spacing: 8) {
                        Text("Resume")
                            .font(.system(size: 15, weight: .semibold))
                        Image(systemName: "doc.text")
                            .font(.system(size: 13, weight: .semibold))
                    }
                    .foregroundStyle(Theme.textPrimary)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 13)
                    .background(
                        Capsule().fill(Color.white.opacity(0.05))
                    )
                    .overlay(
                        Capsule().strokeBorder(Theme.hairline, lineWidth: 1)
                    )
                }
            }
            .padding(.top, 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct AvailabilityDot: View {
    @State private var pulse = false
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.green.opacity(0.35))
                .frame(width: 14, height: 14)
                .scaleEffect(pulse ? 1.0 : 0.4)
                .opacity(pulse ? 0 : 0.7)
                .animation(.easeOut(duration: 1.8).repeatForever(autoreverses: false), value: pulse)
            Circle()
                .fill(Color.green)
                .frame(width: 7, height: 7)
        }
        .frame(width: 14, height: 14)
        .onAppear { pulse = true }
    }
}
