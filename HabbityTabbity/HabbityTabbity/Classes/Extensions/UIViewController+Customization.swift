//
//  UIViewController+Customization.swift
//  HabbityTabbity
//
//  Created by Ikjot Kaur on 3/15/18.
//  Copyright © 2018 Ikjot Kaur. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Add/Remove Keyboard Notification Observers
    func addKeyboardNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    func removeKeyboardNotificationObservers() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
    }
}

