//
//  ExperienceSection.swift
//  Portfolio
//

import SwiftUI

struct ExperienceSection: View {
    let items: [Experience]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                ExperienceRow(item: item, isLast: index == items.count - 1)
            }
        }
        .padding(.vertical, 4)
    }
}

private struct ExperienceRow: View {
    let item: Experience
    let isLast: Bool
    @State private var expanded = false

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            // Timeline rail
            VStack(spacing: 0) {
                Circle()
                    .fill(Theme.accent)
                    .frame(width: 9, height: 9)
                    .padding(.top, 6)
                    .overlay(
                        Circle()
                            .strokeBorder(Theme.accent.opacity(0.3), lineWidth: 5)
                            .frame(width: 19, height: 19)
                            .padding(.top, 6)
                    )
                if !isLast {
                    Rectangle()
                        .fill(Theme.hairline)
                        .frame(width: 1)
                        .frame(maxHeight: .infinity)
                        .padding(.top, 6)
                }
            }
            .frame(width: 20)

            // Content
            VStack(alignment: .leading, spacing: 6) {
                HStack(alignment: .firstTextBaseline) {
                    Text(item.role)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Theme.textPrimary)
                    Spacer()
                    Text(item.period)
                        .font(.mono)
                        .foregroundStyle(Theme.textTertiary)
                }
                Text(item.company)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(Theme.accent)
                Text(item.summary)
                    .font(.system(size: 14))
                    .foregroundStyle(Theme.textSecondary)
                    .lineSpacing(3)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 2)

                if expanded {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(item.highlights, id: \.self) { h in
                            HStack(alignment: .top, spacing: 8) {
                                Text("—")
                                    .foregroundStyle(Theme.textTertiary)
                                Text(h)
                                    .font(.system(size: 13))
                                    .foregroundStyle(Theme.textPrimary.opacity(0.85))
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    .padding(.top, 6)
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }

                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.85)) {
                        expanded.toggle()
                    }
                } label: {
                    HStack(spacing: 4) {
                        Text(expanded ? "Hide details" : "Show details")
                        Image(systemName: expanded ? "chevron.up" : "chevron.down")
                            .font(.system(size: 10, weight: .bold))
                    }
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(Theme.textSecondary)
                }
                .buttonStyle(PressableStyle())
                .padding(.top, 4)
            }
            .padding(.bottom, isLast ? 0 : 20)
        }
    }
}
