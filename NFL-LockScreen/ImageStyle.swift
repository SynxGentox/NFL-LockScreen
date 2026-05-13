//
//  ImageStyle.swift
//  NFL-LockScreen
//
//  Created by Aryan Verma on 13/05/26.
//

import SwiftUI

struct imageStyling: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .clipped()
            .ignoresSafeArea()
    }
}

extension View {
    func imageStyle() -> some View {
        modifier(imageStyling())
    }
}
