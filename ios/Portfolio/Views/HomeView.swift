//
//  HomeView.swift
//  Portfolio
//

import SwiftUI

struct HomeView: View {
    @Binding var showContact: Bool

    // Drives the entrance animation. Cheap — a single `appeared` toggle.
    @State private var appeared = false

    private let profile = PortfolioContent.profile
    private let projects = PortfolioContent.projects
    private let skills = PortfolioContent.skills
    private let experience = PortfolioContent.experience

    var body: some View {
        ZStack(alignment: .top) {
            Theme.background.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: Theme.sectionSpacing) {
                    Spacer().frame(height: 8)
                    HeroSection(profile: profile, showContact: $showContact)
                        .opacity(appeared ? 1 : 0)
                        .offset(y: appeared ? 0 : 12)
                        .animation(.easeOut(duration: 0.55).delay(0.05), value: appeared)

                    SectionHeader(eyebrow: "01 — Work", title: "Selected Projects")
                        .opacity(appeared ? 1 : 0)
                        .animation(.easeOut(duration: 0.5).delay(0.18), value: appeared)

                    ProjectsList(projects: projects)
                        .opacity(appeared ? 1 : 0)
                        .offset(y: appeared ? 0 : 10)
                        .animation(.easeOut(duration: 0.55).delay(0.22), value: appeared)

                    SectionHeader(eyebrow: "02 — Toolkit", title: "Skills & Stack")
                    SkillsSection(groups: skills)

                    SectionHeader(eyebrow: "03 — Journey", title: "Experience")
                    ExperienceSection(items: experience)

                    FooterCTA(showContact: $showContact)
                        .padding(.top, 8)

                    Spacer().frame(height: 40)
                }
                .padding(.horizontal, Theme.hPadding)
            }
            .scrollIndicators(.hidden)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack(spacing: 8) {
                    Circle()
                        .fill(Theme.accent)
                        .frame(width: 6, height: 6)
                    Text("AR")
                        .font(.system(size: 13, weight: .semibold, design: .serif))
                        .foregroundStyle(Theme.textPrimary)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showContact = true
                } label: {
                    Text("Contact")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(Theme.textPrimary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 7)
                        .background(
                            Capsule().fill(Color.white.opacity(0.06))
                        )
                        .overlay(
                            Capsule().strokeBorder(Theme.hairline, lineWidth: 1)
                        )
                }
                .buttonStyle(PressableStyle())
            }
        }
        .onAppear { appeared = true }
    }
}

// MARK: - Section header

struct SectionHeader: View {
    let eyebrow: String
    let title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(eyebrow.uppercased())
                .font(.eyebrow)
                .tracking(1.6)
                .foregroundStyle(Theme.accent)
            Text(title)
                .font(.title2Serif)
                .foregroundStyle(Theme.textPrimary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
