//
//  ActionItemView.swift
//  ActionSheet
//
//  Created by Corey Roberts on 5/23/21.
//

import SwiftUI

struct ActionItemView: View {
    
    let item: ActionItem
    @Binding var isVisible: Bool
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                item.action()
                isVisible = false
            }
        } label: {
            HStack {
                item.image
                Text(item.title)
                Spacer()
                if item.selected {
                    Image(systemName: "checkmark")
                }
            }
        }
        .buttonStyle(ActionButtonStyle(foregroundColor: item.foregroundColor,
                                       backgroundColor: item.backgroundColor))
    }
    
}

struct ActionItem_Previews: PreviewProvider {
    
    @State static var isVisible = true
    
    static var previews: some View {
        let items = [
            ActionItem(image: Image(systemName: "square.and.arrow.up"), title: "Share",
                       selected: true,
                       action: {},
                       type: .default),
            ActionItem(image: Image(systemName: "trash"),
                       title: "Remove",
                       action: {},
                       type: .destructive)
        ]
        
        if isVisible {
            ActionSheet(items: items, isVisible: $isVisible)
                .animation(.spring())
                .transition(.move(edge: .bottom))
        }
    }
}
