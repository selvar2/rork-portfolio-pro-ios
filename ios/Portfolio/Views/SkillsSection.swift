//
//  SkillsSection.swift
//  Portfolio
//

import SwiftUI

struct SkillsSection: View {
    let groups: [SkillGroup]

    var body: some View {
        VStack(spacing: 14) {
            ForEach(groups) { group in
                VStack(alignment: .leading, spacing: 12) {
                    Text(group.title)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(Theme.textPrimary)
                    FlowLayout(spacing: 8) {
                        ForEach(group.items, id: \.self) { item in
                            Text(item)
                                .font(.system(size: 12, weight: .medium))
                                .foregroundStyle(Theme.textSecondary)
                                .padding(.horizontal, 11)
                                .padding(.vertical, 6)
                                .background(
                                    Capsule().fill(Color.white.opacity(0.04))
                                )
                                .overlay(
                                    Capsule().strokeBorder(Theme.hairline, lineWidth: 1)
                                )
                        }
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .card()
            }
        }
    }
}
