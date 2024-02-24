//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Gianmarco on 22/02/24.
//

import SwiftUI

struct StandardsButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
    }
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardsButtonStyle())
    }
}
