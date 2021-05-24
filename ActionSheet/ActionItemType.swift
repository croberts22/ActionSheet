//
//  ActionItemType.swift
//  ActionSheet
//
//  Created by Corey Roberts on 5/23/21.
//

import SwiftUI

enum ActionItemType {
    case `default`, cancel, destructive, custom(Color)
    
    var foregroundColor: Color {
        switch self {
        case .default, .cancel:
            return .blue
        case .destructive:
            return .red
        case .custom(let color):
            return color
        }
    }
}
