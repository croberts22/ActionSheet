//
//  ActionItem.swift
//  ActionSheet
//
//  Created by Corey Roberts on 5/19/21.
//

import SwiftUI

struct ActionItem: Identifiable {
    
    let id = UUID()
    let image: Image
    let title: String
    var selected: Bool = false
    let action: (() -> Void)
    var type: ActionItemType = .default
    
    // MARK: - Attributed Properties
    
    var foregroundColor: Color { type.foregroundColor }
    var backgroundColor = Color.white
    var highlightedColor = Color(white: 0.9, opacity: 1.0)
    
}
