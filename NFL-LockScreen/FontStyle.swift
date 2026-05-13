//
//  FontStyle.swift
//  NFL-LockScreen
//
//  Created by Aryan Verma on 12/05/26.
//

import SwiftUI

struct clockStyle: ViewModifier {
    @ScaledMetric(relativeTo: .largeTitle) var fontSize: CGFloat = 60
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize).monospacedDigit())
            .fontWeight(.bold)
//            .fontWidth(.compressed)
            .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
            .shadow(color: .white.opacity(0.6), radius: 0, x: -1, y: -1)
            .foregroundStyle(.ultraThinMaterial.opacity(0.9))
    }
}

extension View {
    func clockFont(fontSize: CGFloat) -> some View {
        modifier(clockStyle(fontSize: fontSize))
    }
}

struct dateStyle: ViewModifier {
    @ScaledMetric(relativeTo: .largeTitle) var fontSize: CGFloat = 60
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize).monospacedDigit())
            .fontWeight(.bold)
            .foregroundStyle(.white.opacity(0.6))
    }
}

extension View {
    func dateFont(fontSize: CGFloat) -> some View {
        modifier(dateStyle(fontSize: fontSize))
    }
}
