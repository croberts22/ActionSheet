//
//  ContentView.swift
//  ActionSheet
//
//  Created by Corey Roberts on 5/19/21.
//

import SwiftUI

struct ContentView: View {

    @State private var isVisible = false

    let items = [
        ActionItem(image: Image(systemName: "square.and.arrow.up"), title: "Share",
                   selected: true,
                   action: {
                    print("Selected Share")
                   },
                   type: .default),
        ActionItem(image: Image(systemName: "trash"),
                   title: "Remove",
                   action: {},
                   type: .destructive)
    ]

    var body: some View {
        ZStack {
            Button("Pick me!") {
                withAnimation {
                    isVisible = true
                }
            }
            .foregroundColor(.white)
            .disabled(isVisible)

            if isVisible {
                VStack {
                    Spacer()
                    ActionSheet(items: items) {
                        isVisible = false
                    }
                }
                .animation(.spring())
                .transition(.move(edge: .bottom))
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
