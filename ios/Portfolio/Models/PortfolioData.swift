//
//  PortfolioData.swift
//  Portfolio
//
//  Static portfolio content. Easy to edit — single source of truth.
//

import Foundation
import SwiftUI

// MARK: - Models

struct Profile {
    let name: String
    let role: String
    let location: String
    let intro: String
    let email: String
    let github: String
    let linkedin: String
    let website: String
}

struct Project: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let tagline: String
    let summary: String
    let role: String
    let year: String
    let stack: [String]
    let highlights: [String]
    let metrics: [Metric]
    let accent: Color

    struct Metric: Hashable {
        let value: String
        let label: String
    }
}

struct SkillGroup: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let items: [String]
}

struct Experience: Identifiable, Hashable {
    let id = UUID()
    let company: String
    let role: String
    let period: String
    let summary: String
    let highlights: [String]
}

// MARK: - Content

enum PortfolioContent {
    static let profile = Profile(
        name: "Alex Rivera",
        role: "Senior iOS Engineer",
        location: "San Francisco, CA",
        intro: "I build refined, high-performance mobile products. Eight years shipping consumer iOS apps used by millions — focused on craft, motion, and engineering depth.",
        email: "alex.rivera@example.com",
        github: "github.com/alexrivera",
        linkedin: "linkedin.com/in/alexrivera",
        website: "alexrivera.dev"
    )

    static let projects: [Project] = [
        Project(
            title: "Atlas",
            tagline: "A minimalist habit tracker — featured on the App Store.",
            summary: "Designed and shipped a habit tracking app focused on calm, weekly cadence. Built a custom timeline UI, on-device analytics, and Health integration. Reduced cold start by 38% via a deferred SwiftData migration path.",
            role: "Sole iOS Engineer & Designer",
            year: "2025",
            stack: ["Swift", "SwiftUI", "SwiftData", "HealthKit", "Charts"],
            highlights: [
                "Featured by Apple in “Apps We Love” — March 2025",
                "4.9★ across 12,400 ratings",
                "Implemented custom motion system at 60–120fps"
            ],
            metrics: [
                .init(value: "120K+", label: "MAU"),
                .init(value: "38%", label: "Faster launch"),
                .init(value: "4.9★", label: "App Store")
            ],
            accent: Color(red: 0.91, green: 0.78, blue: 0.48)
        ),
        Project(
            title: "Northbound",
            tagline: "Trail navigation for the offline backcountry.",
            summary: "Led the iOS rebuild from UIKit to SwiftUI. Architected an offline tile renderer using MapKit overlays and a custom MBTiles pipeline. Shipped Live Activities for trip tracking.",
            role: "Tech Lead, iOS",
            year: "2024",
            stack: ["SwiftUI", "MapKit", "CoreLocation", "ActivityKit", "Metal"],
            highlights: [
                "Cut memory footprint 42% on iPhone 12 baseline",
                "Shipped Live Activities + Dynamic Island",
                "Led team of 4 across two release cycles"
            ],
            metrics: [
                .init(value: "42%", label: "Less memory"),
                .init(value: "60fps", label: "Map pan/zoom"),
                .init(value: "v3.0", label: "Released")
            ],
            accent: Color(red: 0.46, green: 0.78, blue: 0.69)
        ),
        Project(
            title: "Cadence",
            tagline: "A pro-grade metronome and rhythm trainer.",
            summary: "Side project that became a paid utility with 30k+ downloads. Built a sample-accurate audio engine on AVAudioEngine with sub-2ms tap latency, and a fully custom waveform UI.",
            role: "Independent",
            year: "2023",
            stack: ["AVAudioEngine", "CoreAudio", "SwiftUI", "StoreKit 2"],
            highlights: [
                "Sub-2ms audio scheduling jitter",
                "Custom Canvas-based waveform renderer",
                "Profitable on day 14 of launch"
            ],
            metrics: [
                .init(value: "30K+", label: "Downloads"),
                .init(value: "<2ms", label: "Audio jitter"),
                .init(value: "$8K", label: "MRR")
            ],
            accent: Color(red: 0.78, green: 0.55, blue: 0.95)
        ),
        Project(
            title: "Loop",
            tagline: "Internal design system & component library.",
            summary: "Built a SwiftUI design system adopted across three product teams. Token-driven theming, snapshot testing, and a documentation site generated from source.",
            role: "Platform Engineer",
            year: "2022",
            stack: ["SwiftUI", "Swift Package Manager", "DocC", "Snapshot Testing"],
            highlights: [
                "Reduced new-screen build time by ~3x",
                "120+ documented components",
                "Adopted by 14 engineers across 3 teams"
            ],
            metrics: [
                .init(value: "120+", label: "Components"),
                .init(value: "3x", label: "Faster screens"),
                .init(value: "3", label: "Teams")
            ],
            accent: Color(red: 0.96, green: 0.55, blue: 0.42)
        )
    ]

    static let skills: [SkillGroup] = [
        .init(title: "Languages", items: ["Swift", "Objective-C", "TypeScript", "Python"]),
        .init(title: "Frameworks", items: ["SwiftUI", "UIKit", "Combine", "SwiftData", "Core Data"]),
        .init(title: "Platform", items: ["HealthKit", "MapKit", "AVFoundation", "ActivityKit", "StoreKit 2", "WidgetKit"]),
        .init(title: "Engineering", items: ["Performance Profiling", "Instruments", "Modular Architecture", "CI/CD", "Snapshot Testing"]),
        .init(title: "Design", items: ["Figma", "Motion Design", "Accessibility", "Design Systems"])
    ]

    static let experience: [Experience] = [
        .init(
            company: "Northbound Outdoors",
            role: "Tech Lead, iOS",
            period: "2023 — Present",
            summary: "Lead a team of 4 iOS engineers. Own architecture, performance, and release strategy.",
            highlights: [
                "Led migration of 220k LOC from UIKit to SwiftUI",
                "Reduced p95 launch time by 41%",
                "Owner of the iOS hiring loop"
            ]
        ),
        .init(
            company: "Aperture Labs",
            role: "Senior iOS Engineer",
            period: "2020 — 2023",
            summary: "Consumer photo app, 8M monthly users. Shipped the Memories surface and rebuilt the camera stack.",
            highlights: [
                "Designed Metal-based filter pipeline",
                "Owned the editor on 6 major releases",
                "Mentored 5 junior engineers"
            ]
        ),
        .init(
            company: "Field Studio",
            role: "iOS Engineer",
            period: "2018 — 2020",
            summary: "Boutique product studio. Shipped 9 apps across fitness, finance, and media.",
            highlights: [
                "Two App Store features",
                "Built shared design system used in 6 projects"
            ]
        )
    ]
}
