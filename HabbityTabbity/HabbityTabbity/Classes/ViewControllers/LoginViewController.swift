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
        if self.checkData() {
            if !HTHelper.isInternetConnected() {
                NRActivityView.showBannerMessage(noInternetConnectionString, isSuccess: false)
            }
            Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                if error == nil {
                    print("You have successfully logged in")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let signupController = storyboard.instantiateViewController(withIdentifier: "DashboardViewController")
                    self.navigationController?.pushViewController(signupController, animated: true)
                } else {
                    NRActivityView.showBannerMessage(someErrorOccuredString, isSuccess: false)
                }
            }
        }
        
    }
   
    @IBAction func signupAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signupController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        self.navigationController?.pushViewController(signupController, animated: true)
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signupController = storyboard.instantiateViewController(withIdentifier: "ForgotPasswordViewController")
        self.navigationController?.pushViewController(signupController, animated: true)
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
    
     private func checkData() -> Bool {
        let emailString : String? = self.emailTextField.text
        let passwordString : String? = self.passwordTextField.text
        
        if emailString?.isEmpty == false && passwordString?.isEmpty == false {
            return true
        } else if emailString?.isEmpty == true {
            NRActivityView.showBannerMessage(emailBlank, isSuccess: false)
            return false
        } else if passwordString?.isEmpty == true{
            NRActivityView.showBannerMessage(passwordBlank, isSuccess: false)
            return false
        }
        return false
    }
}

