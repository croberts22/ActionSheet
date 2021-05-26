//
//  ActionSheetViewController.swift
//  ActionSheet
//
//  Created by Corey Roberts on 5/26/21.
//

import SwiftUI
import Foundation
import UIKit

final class ActionSheetViewController: UIHostingController<ActionSheet> {
    
    init(items: [ActionItem]) {
        let rootView = ActionSheet(items: items)
        super.init(rootView: rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
    }
    
    public var completionHandler: (() -> Void)? {
        didSet {
            rootView.completionHandler = { [weak self] in
                guard let self = self else { return }
                
                self.completionHandler?()
                if self.shouldDismissAutomatically {
                    self.dismiss(animated: true)
                }
            }
        }
    }
    
    public var shouldDismissAutomatically = true
    
}
