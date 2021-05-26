//
//  ActionSheet.swift
//  ActionSheet
//
//  Created by Corey Roberts on 5/19/21.
//

import SwiftUI

struct ActionSheet: View {
    
    let items: [ActionItem]
    
    @State var isVisible: Bool = true
    @State var completionHandler: (() -> ())?
    
    var body: some View {
        VStack {
            VStack(spacing: 0.0) {
                ForEach(items) {
                    ActionItemView(item: $0, isVisible: $isVisible, completionHandler: $completionHandler)
                    if $0.id != items.last?.id {
                        Divider()
                            .padding(.horizontal)
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(12.0)
            .padding(.horizontal)
            
            VStack {
                HStack {
                    Button {
                        withAnimation(.spring()) {
                            isVisible = false
                            completionHandler?()
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text("Cancel")
                            Spacer()
                        }
                    }
                    .buttonStyle(ActionButtonStyle())
                }
            }
            .background(Color.white)
            .cornerRadius(12.0)
            .padding(.horizontal)
        }
    }
    
    func show() {
        isVisible.toggle()
    }
}

struct ActionSheet_Previews: PreviewProvider {
    
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
        
        ZStack {
            Rectangle()
                .foregroundColor(Color.blue)
                .ignoresSafeArea()
            
            if isVisible {
                ActionSheet(items: items, isVisible: true)
            }
        }
        .preferredColorScheme(.dark)
    }
}
