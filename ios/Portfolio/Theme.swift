//
//  Theme.swift
//  Portfolio
//
//  Centralized design tokens. Keeping everything here makes the
//  visual language consistent and easy to tweak.
//

import SwiftUI

enum Theme {
    // MARK: Palette
    static let background = Color(red: 0.043, green: 0.043, blue: 0.059)        // #0B0B0F
    static let surface    = Color(red: 0.086, green: 0.086, blue: 0.113)        // #16161D
    static let surfaceHi  = Color(red: 0.117, green: 0.117, blue: 0.149)        // #1E1E26
    static let hairline   = Color.white.opacity(0.08)
    static let textPrimary   = Color(red: 0.96, green: 0.96, blue: 0.97)
    static let textSecondary = Color.white.opacity(0.62)
    static let textTertiary  = Color.white.opacity(0.40)
    static let accent     = Color(red: 0.91, green: 0.78, blue: 0.48)            // #E8C77A warm gold
    static let accentSoft = Color(red: 0.91, green: 0.78, blue: 0.48).opacity(0.14)

    // MARK: Radii
    static let rSm: CGFloat = 10
    static let rMd: CGFloat = 16
    static let rLg: CGFloat = 22

    // MARK: Spacing
    static let sectionSpacing: CGFloat = 36
    static let hPadding: CGFloat = 20
}

// MARK: - Typography

extension Font {
    static let displayXL = Font.system(size: 44, weight: .bold, design: .serif)
    static let display   = Font.system(size: 34, weight: .bold, design: .serif)
    static let title2Serif = Font.system(size: 24, weight: .semibold, design: .serif)
    static let eyebrow   = Font.system(size: 11, weight: .semibold, design: .default)
    static let bodyRefined = Font.system(size: 16, weight: .regular, design: .default)
    static let mono      = Font.system(size: 12, weight: .medium, design: .monospaced)
}

// MARK: - Shared modifiers

struct CardBackground: ViewModifier {
    var radius: CGFloat = Theme.rMd
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .fill(Theme.surface)
            )
            .overlay(
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(Theme.hairline, lineWidth: 1)
            )
    }
}

extension View {
    func card(radius: CGFloat = Theme.rMd) -> some View {
        modifier(CardBackground(radius: radius))
    }
}

struct PressableStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.85 : 1.0)
            .animation(.spring(response: 0.28, dampingFraction: 0.7), value: configuration.isPressed)
    }
}
