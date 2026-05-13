//
//  FlowLayout.swift
//  Portfolio
//
//  Lightweight wrapping HStack — used for skill/tech chip clouds.
//

import SwiftUI

struct FlowLayout<Content: View>: View {
    var spacing: CGFloat = 8
    @ViewBuilder let content: () -> Content

    @State private var totalHeight: CGFloat = .zero

    var body: some View {
        GeometryReader { geometry in
            generateContent(in: geometry)
        }
        .frame(height: totalHeight)
    }

    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width: CGFloat = .zero
        var height: CGFloat = .zero

        return ZStack(alignment: .topLeading) {
            content()
                .padding(.trailing, spacing)
                .padding(.bottom, spacing)
                .alignmentGuide(.leading) { dimension in
                    if abs(width - dimension.width) > geometry.size.width {
                        width = 0
                        height -= dimension.height
                    }

                    let result = width
                    width -= dimension.width
                    return result
                }
                .alignmentGuide(.top) { dimension in
                    let result = height
                    return result
                }
        }
        .background(heightReader($totalHeight))
    }

    private func heightReader(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: FlowLayoutHeightPreferenceKey.self, value: geometry.size.height)
        }
        .onPreferenceChange(FlowLayoutHeightPreferenceKey.self) { binding.wrappedValue = $0 }
    }
}

private struct FlowLayoutHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
