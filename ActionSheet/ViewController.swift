//
//  ViewController.swift
//  ActionSheet
//
//  Created by Corey Roberts on 5/26/21.
//

import SwiftUI
import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pick me!", for: .normal)
        
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(display), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc private func display() {
        let items = [
            ActionItem(image: Image(systemName: "square.and.arrow.up"), title: "Share", action: {
                print("yay share!")
            }),
            ActionItem(image: Image(systemName: "paperplane"), title: "Really Share It", action: {
                print("you really shared it!")
            })
        ]
        
        let actionSheet = ActionSheet(items: items, isVisible: false) {
            print("nice")
        }
        
        let controller = UIHostingController(rootView: actionSheet)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.backgroundColor = .clear
        addChild(controller)
        view.addSubview(controller.view)
        controller.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        actionSheet.show()
    }
    
}
