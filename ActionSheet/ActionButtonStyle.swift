//
//  ActionButtonStyle.swift
//  ActionSheet
//
//  Created by Corey Roberts on 5/23/21.
//

import SwiftUI

struct ActionButtonStyle: ButtonStyle {
    
    var foregroundColor = Color.blue
    var backgroundColor = Color.white
    var highlightedColor = Color(white: 0.9, opacity: 1.0)
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(foregroundColor)
            .background(configuration.isPressed ? highlightedColor : backgroundColor)
    }
    
}
