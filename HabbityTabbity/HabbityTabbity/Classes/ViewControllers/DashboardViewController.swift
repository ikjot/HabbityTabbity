//
//  DashboardViewController.swift
//  HabbityTabbity
//
//  Created by Ikjot Kaur on 3/31/18.
//  Copyright © 2018 Ikjot Kaur. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var noHabitsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Habits"
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        let attrs = [
            NSAttributedStringKey.foregroundColor: UIColor.ht_app_blue_color(),
            NSAttributedStringKey.font: UIFont(name: "ChalkboardSE-Light", size: 22)!
            ] as [NSAttributedStringKey : Any]
        UINavigationBar.appearance().titleTextAttributes = attrs
        self.navigationController?.isNavigationBarHidden = false
        self.addMenuButton()
        self.addPlusButton()
    }
    
    override func navigationRightButtonClicked() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signupController = storyboard.instantiateViewController(withIdentifier: "AddNewHabitViewController")
        self.navigationController?.pushViewController(signupController, animated: true)
    }
    
    override func navigationBackButtonClicked() {
    }
    
}
