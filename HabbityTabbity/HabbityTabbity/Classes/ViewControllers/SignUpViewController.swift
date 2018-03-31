//
//  SignUpViewController.swift
//  HabbityTabbity
//
//  Created by Ikjot Kaur on 3/18/18.
//  Copyright © 2018 Ikjot Kaur. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailAddressTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    override func keyboardWillShow(_ notification: Notification) {
        let info = notification.userInfo as! [String: AnyObject],
        kbSize = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size,
        contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height + 5, right: 0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        var aRect = self.view.frame
        aRect.size.height -= kbSize.height + 5
        if aRect.contains(confirmPasswordTextField!.frame.origin) {
            self.scrollView.scrollRectToVisible(passwordTextField!.frame, animated: true)
        }
    }
    
    override func keyboardWillHide(_ notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
 
    }

    @IBAction func createAccountAction(_ sender: UIButton) {
        if emailAddressTextfield.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: emailAddressTextfield.text!, password: passwordTextField.text!) { (user, error) in
                if error == nil {
                    print("You have successfully signed up")
                    self.navigationController?.popViewController(animated: true)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
