//
//  ProjectsList.swift
//  Portfolio
//

import SwiftUI

struct ProjectsList: View {
    let projects: [Project]

    var body: some View {
        // LazyVStack keeps memory low — cells materialize on demand.
        LazyVStack(spacing: 14) {
            ForEach(Array(projects.enumerated()), id: \.element.id) { index, project in
                NavigationLink(value: project) {
                    ProjectCard(project: project, index: index + 1)
                }
                .buttonStyle(PressableStyle())
            }
        }
    }
}

struct ProjectCard: View {
    let project: Project
    let index: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Top row: index + year + accent dot
            HStack(spacing: 10) {
                Text(String(format: "%02d", index))
                    .font(.mono)
                    .foregroundStyle(Theme.textTertiary)
                Rectangle()
                    .fill(Theme.hairline)
                    .frame(height: 1)
                Text(project.year)
                    .font(.mono)
                    .foregroundStyle(Theme.textTertiary)
                Circle()
                    .fill(project.accent)
                    .frame(width: 7, height: 7)
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(project.title)
                    .font(.system(size: 26, weight: .semibold, design: .serif))
                    .foregroundStyle(Theme.textPrimary)
                Text(project.tagline)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(Theme.textSecondary)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
            }

            // Stack chips — horizontal scroll, lightweight.
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(project.stack.prefix(5), id: \.self) { tech in
                        Text(tech)
                            .font(.system(size: 11, weight: .medium))
                            .foregroundStyle(Theme.textSecondary)
                            .padding(.horizontal, 9)
                            .padding(.vertical, 5)
                            .background(
                                Capsule().fill(Color.white.opacity(0.05))
                            )
                            .overlay(
                                Capsule().strokeBorder(Theme.hairline, lineWidth: 1)
                            )
                    }
                }
            }
            .contentMargins(.horizontal, 0)

            HStack {
                Text("View case study")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(project.accent)
                Spacer()
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(project.accent)
            }
            .padding(.top, 2)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            // Subtle one-color tint overlay (cheap, no blur)
            RoundedRectangle(cornerRadius: Theme.rLg, style: .continuous)
                .fill(Theme.surface)
        )
        .overlay(
            RoundedRectangle(cornerRadius: Theme.rLg, style: .continuous)
                .strokeBorder(Theme.hairline, lineWidth: 1)
        )
        .overlay(alignment: .topTrailing) {
            // Accent corner glow — drawn once, no live blur
            Circle()
                .fill(project.accent.opacity(0.18))
                .frame(width: 90, height: 90)
                .offset(x: 28, y: -28)
                .blur(radius: 24)
                .allowsHitTesting(false)
        }
        .clipShape(RoundedRectangle(cornerRadius: Theme.rLg, style: .continuous))
    }
}
