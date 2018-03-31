//
//  ForgotPasswordViewController.swift
//  HabbityTabbity
//
//  Created by Ikjot Kaur on 3/31/18.
//  Copyright © 2018 Ikjot Kaur. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.addKeyboardNotificationObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.removeKeyboardNotificationObservers()
    }
    
    // MARK: - Text field delegate methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func resetPasswordAction(_ sender: UIButton) {
        
        if self.emailTextField.text?.isEmpty == true{
            NRActivityView.showBannerMessage(emailBlank, isSuccess: false)
        } else {
            Auth.auth().sendPasswordReset(withEmail: self.emailTextField.text!, completion: { (error) in
            
                if error != nil {
                    NRActivityView.showBannerMessage(errorMessageForgotPassword, isSuccess: false)
                } else {
                    NRActivityView.showBannerMessage(successMessageForgotPassword, isSuccess: true)
                    self.navigationController?.popViewController(animated: true)
                }
            })
        }
        
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signupController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        self.navigationController?.pushViewController(signupController, animated: true)
    }
    
}

