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
    
    func addMenuButton() {
        self.editLeftNavigationButton("menu", title: nil, selectedTitle: nil, font: nil)
    }
    
    func addPlusButton(){
        self.editRightNavigationButton("addItem", title: nil, selectedTitle: nil, font: nil)
    }
    
    func addBackButton(){
        self.editLeftNavigationButton("back", title: nil, selectedTitle: nil, font: nil)

    }
    
    func editLeftNavigationButton(_ imageName: String?, title: String?, selectedTitle: String?, font: UIFont?) {
        
        let button = createButton(CGRect(x: 0, y: 0, width: 100, height: 100), imageName:imageName, title:title, selectedTitle: selectedTitle, font: font)
        button.contentHorizontalAlignment = .left
        if (title == nil) {
            button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: -10)
        }
        
        button.addTarget(self, action: #selector(UIViewController.navigationBackButtonClicked), for: UIControlEvents.touchUpInside)
        let backButtonItem: UIBarButtonItem = UIBarButtonItem(customView: button)
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem=nil
        self.navigationItem.leftBarButtonItem = backButtonItem
        
    }
    
    func editRightNavigationButton(_ imageName: String?, title: String?, selectedTitle: String?, font: UIFont?) {
            
            let button = createButton(CGRect(x: 0, y: 0, width: 100, height: 100), imageName:imageName, title:title, selectedTitle: selectedTitle, font: font)
            if (title == nil) {
                button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: -10)
            }
            
            button.addTarget(self, action: #selector(UIViewController.navigationRightButtonClicked), for: UIControlEvents.touchUpInside)
            let backButtonItem: UIBarButtonItem = UIBarButtonItem(customView: button)
            
            self.navigationItem.hidesBackButton = true
            self.navigationItem.rightBarButtonItem=nil
            self.navigationItem.rightBarButtonItem = backButtonItem
            
        
    }
    
    @objc func navigationBackButtonClicked() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @objc func navigationRightButtonClicked() {
    }
    
    fileprivate func createButton(_ frame: CGRect, imageName: String?, title: String?, selectedTitle: String?, font: UIFont?) -> UIButton {
        let button: UIButton?
        if let img = imageName {
            button = UIButton(type:UIButtonType.system)
            button!.setImage(UIImage(named: img), for: UIControlState.normal)
            
            button!.setImage(UIImage(named: img), for: UIControlState.selected)
            button!.setImage(UIImage(named: img), for: UIControlState.highlighted)
            button!.tintColor=UIColor.ht_app_blue_color()
        } else {
            button = UIButton(type:UIButtonType.custom)
        }
        
        if let tempFont = font {
            button?.titleLabel?.font = tempFont
        } else {
            button!.titleLabel?.font = UIFont(name: "ChalkboardSE-Bold", size: 18)
        }
        
        button!.frame = frame
        
        if let btnTitle = title {
            button!.setTitle(btnTitle, for: UIControlState.normal)
        }
        if let selectedBtnTitle = selectedTitle {
            button!.setTitle(selectedBtnTitle, for: UIControlState.selected)
        }
        button!.setTitleColor(UIColor.ht_app_blue_color(), for: UIControlState.normal)
        button!.setTitleColor(UIColor.ht_app_blue_color(), for: UIControlState.selected)
        button!.isExclusiveTouch = true
        button!.imageView?.contentMode=UIViewContentMode.scaleAspectFit
        button?.contentHorizontalAlignment=UIControlContentHorizontalAlignment.right
        
        return button!
    }

    
    func editRightNavigationButton() {
        
    }
}

