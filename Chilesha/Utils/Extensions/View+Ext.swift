//
//  View+Ext.swift
//  Chilesha
//
//  Created by shayne song on 4/8/25.
//

import Foundation
import SwiftUI

struct TapEffect: ViewModifier {
    let action: () -> Void
    @State private var isPressed = false
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .opacity(isPressed ? 0.9 : 1.0)
            .animation(.easeOut(duration: 0.2), value: isPressed)
            .onTapGesture {
                action()
            }
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in isPressed = true }
                    .onEnded { _ in isPressed = false }
            )
    }
}

extension View {
    func withTapEffect(action: @escaping () -> Void) -> some View {
        self.modifier(TapEffect(action: action))
    }
}
