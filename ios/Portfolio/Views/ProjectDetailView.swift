//
//  ProjectDetailView.swift
//  Portfolio
//

import SwiftUI

struct ProjectDetailView: View {
    let project: Project

    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    headerArt
                        .padding(.horizontal, Theme.hPadding)

                    VStack(alignment: .leading, spacing: 8) {
                        Text(project.role.uppercased())
                            .font(.eyebrow)
                            .tracking(1.4)
                            .foregroundStyle(project.accent)
                        Text(project.title)
                            .font(.display)
                            .foregroundStyle(Theme.textPrimary)
                        Text(project.tagline)
                            .font(.system(size: 17, weight: .regular))
                            .foregroundStyle(Theme.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.horizontal, Theme.hPadding)

                    metricsRow
                        .padding(.horizontal, Theme.hPadding)

                    section(title: "Overview") {
                        Text(project.summary)
                            .font(.bodyRefined)
                            .foregroundStyle(Theme.textSecondary)
                            .lineSpacing(5)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    section(title: "Highlights") {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(project.highlights, id: \.self) { item in
                                HStack(alignment: .top, spacing: 12) {
                                    Circle()
                                        .fill(project.accent)
                                        .frame(width: 5, height: 5)
                                        .padding(.top, 8)
                                    Text(item)
                                        .font(.system(size: 15))
                                        .foregroundStyle(Theme.textPrimary.opacity(0.88))
                                        .lineSpacing(3)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                    }

                    section(title: "Stack") {
                        FlowLayout(spacing: 8) {
                            ForEach(project.stack, id: \.self) { tech in
                                Text(tech)
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundStyle(Theme.textPrimary)
                                    .padding(.horizontal, 11)
                                    .padding(.vertical, 6)
                                    .background(
                                        Capsule().fill(Color.white.opacity(0.05))
                                    )
                                    .overlay(
                                        Capsule().strokeBorder(Theme.hairline, lineWidth: 1)
                                    )
                            }
                        }
                    }

                    Spacer().frame(height: 24)
                }
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Header art

    private var headerArt: some View {
        ZStack {
            LinearGradient(
                colors: [project.accent.opacity(0.55), project.accent.opacity(0.0)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .overlay(
                // Subtle grid texture — static, cheap
                Canvas { context, size in
                    let step: CGFloat = 28
                    let line = Path { p in
                        var x: CGFloat = 0
                        while x < size.width { p.move(to: .init(x: x, y: 0)); p.addLine(to: .init(x: x, y: size.height)); x += step }
                        var y: CGFloat = 0
                        while y < size.height { p.move(to: .init(x: 0, y: y)); p.addLine(to: .init(x: size.width, y: y)); y += step }
                    }
                    context.stroke(line, with: .color(.white.opacity(0.05)), lineWidth: 0.5)
                }
            )
            VStack {
                Spacer()
                HStack {
                    Text(project.title.prefix(1))
                        .font(.system(size: 96, weight: .bold, design: .serif))
                        .foregroundStyle(.white.opacity(0.85))
                    Spacer()
                    Text(project.year)
                        .font(.mono)
                        .foregroundStyle(.white.opacity(0.6))
                }
                .padding(20)
            }
        }
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: Theme.rLg, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: Theme.rLg, style: .continuous)
                .strokeBorder(Theme.hairline, lineWidth: 1)
        )
    }

    // MARK: - Metrics

    private var metricsRow: some View {
        HStack(spacing: 10) {
            ForEach(project.metrics, id: \.self) { metric in
                VStack(alignment: .leading, spacing: 4) {
                    Text(metric.value)
                        .font(.system(size: 22, weight: .semibold, design: .serif))
                        .foregroundStyle(Theme.textPrimary)
                    Text(metric.label)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(Theme.textTertiary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(14)
                .card()
            }
        }
    }

    @ViewBuilder
    private func section<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title.uppercased())
                .font(.eyebrow)
                .tracking(1.4)
                .foregroundStyle(Theme.textTertiary)
            content()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, Theme.hPadding)
    }
}
