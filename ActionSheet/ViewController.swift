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
                print("Nice share!")
            }),
            ActionItem(image: Image(systemName: "paperplane"), title: "Send a Paper Plane", action: {
                print("Woosh!")
            })
        ]
        
        let actionSheetViewController = ActionSheetViewController(items: items)
        actionSheetViewController.completionHandler = {
            print("Action sheet completed!")
        }

        present(actionSheetViewController, animated: true)
    }
    
}
