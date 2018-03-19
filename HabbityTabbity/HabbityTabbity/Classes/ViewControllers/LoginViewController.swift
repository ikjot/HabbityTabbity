//
//  LoginViewController
//  HabbityTabbity
//
//  Created by Ikjot Kaur on 3/15/18.
//  Copyright © 2018 Ikjot Kaur. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
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
    
    override func keyboardWillShow(_ notification: Notification) {
        let info = notification.userInfo as! [String: AnyObject],
        kbSize = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size,
        contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height + 5, right: 0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        var aRect = self.view.frame
        aRect.size.height -= kbSize.height + 5
        if aRect.contains(passwordTextField!.frame.origin) {
            self.scrollView.scrollRectToVisible(passwordTextField!.frame, animated: true)
        }
    }
    
    override func keyboardWillHide(_ notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        if self.emailTextField.text == "" || self.passwordTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                if error == nil {
                    print("You have successfully logged in")
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    
    //
    //    @IBAction func logOutAction(sender: AnyObject) {
    //        if FIRAuth.auth()?.currentUser != nil {
    //            do {
    //                try FIRAuth.auth()?.signOut()
    //                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUp")
    //                present(vc, animated: true, completion: nil)
    //
    //            } catch let error as NSError {
    //                print(error.localizedDescription)
    //            }
    //        }
    //    }
    //
    
//    @IBAction func resetAction(_ sender: AnyObject) {
//
//        if self.emailTextField.text == "" {
//            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
//
//            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//            alertController.addAction(defaultAction)
//            
//            present(alertController, animated: true, completion: nil)
//
//        } else {
//            FIRAuth.auth()?.sendPasswordReset(withEmail: self.emailTextField.text!, completion: { (error) in
//
//                var title = ""
//                var message = ""
//
//                if error != nil {
//                    title = "Error!"
//                    message = (error?.localizedDescription)!
//                } else {
//                    title = "Success!"
//                    message = "Password reset email sent."
//                    self.emailTextField.text = ""
//                }
//
//                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                alertController.addAction(defaultAction)
//
//                self.present(alertController, animated: true, completion: nil)
//            })
//        }
//    }
}

