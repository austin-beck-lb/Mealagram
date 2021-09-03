//
//  CustomStyles.swift
//  Mealagram
//
//  Created by Brandon Shaw on 9/3/21.
//

import SwiftUI

struct ClickButtonStyle: ButtonStyle {
    public func makeBody(configuration: ClickButtonStyle.Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.95 : 1)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
