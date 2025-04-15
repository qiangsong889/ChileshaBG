//
//  CustomModifiers.swift
//  Chilesha
//
//  Created by shayne song on 4/9/25.
//

import Foundation
import SwiftUI

struct StandardButtonStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    var textColor: Color {
        if colorScheme == .dark {
            return Color.white
        } else {
            return Color.black
        }
    }
    func body(content: Content) -> some View {
        content
//            .frame(width: .infinity, height: 60)
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
            .foregroundStyle(textColor)
        
    }
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}

