//
//  AddNewHabitViewController.swift
//  HabbityTabbity
//
//  Created by Ikjot Kaur on 3/31/18.
//  Copyright © 2018 Ikjot Kaur. All rights reserved.
//

import UIKit

class AddNewHabitViewController: UIViewController {
    @IBOutlet weak var baseView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.title = "New Habit"
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        let attrs = [
            NSAttributedStringKey.foregroundColor: UIColor.ht_app_blue_color(),
            NSAttributedStringKey.font: UIFont(name: "ChalkboardSE-Light", size: 22)!
            ] as [NSAttributedStringKey : Any]
        UINavigationBar.appearance().titleTextAttributes = attrs
        self.navigationController?.isNavigationBarHidden = false
        self.addBackButton()
        baseView.layer.cornerRadius = 8.0
    }

}
