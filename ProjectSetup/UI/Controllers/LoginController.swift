//
//  LoginController.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import UIKit

/// This class is used to validate the user authentication.
class LoginController: ScreenViewController<LoginViewModel>, ScreenProtocol {
    
    //IBOutlets
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var isSignInPathForUniversalLink:Bool = false
    var sharedCode:String = ""
    
    //MARK:- View Life Cycle
    /// Implement loadView to create a view hierarchy programmatically, without using a nib.
    override func loadView() {
        super.loadView()
        configureOnLoad()
    }
    
    /// Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureAfterLoad()
    }
    
    //MARK:- Screen Protocol
    func configureOnLoad() {}
    
    func configureAfterLoad() {
        self.viewModel = LoginViewModel()
    }
    
    //MARK:- IBAction Tapped Method
    /// Action of the help.
    /// - Parameter sender: Pass UIButton object
    @IBAction func actionHelpLogin(_ sender: UIButton) {
    }
    
    /// Action of the login button.
    /// - Parameter sender: Pass UIButton object
    @IBAction func actionLogin(_ sender: UIButton) {
        self.errorLabel.text = "Logging in..."
        self.viewModel.username = userNameTextField.text ?? ""
        self.viewModel.password = passwordTextField.text ?? ""
        
        if self.viewModel.isValidTextField(userName: self.userNameTextField.text ?? "", password: self.passwordTextField.text ?? "", completion: { (message) in
            self.errorLabel.text = message
        }){
            self.viewModel.signIn { (loginResponse, error) in
                self.userNameTextField.text = ""
                self.passwordTextField.text = ""
                self.errorLabel.text = "Successfully Login!"
                if error != nil {
                    if let error = error {
                        self.errorLabel.text = error.message
                    }else{
                        self.errorLabel.text = StringConstant.errorMessage.InvalidNamePassword
                    }
                }else{
//                    LicenseValidator.shared.license { (hasValidLicense, error) in
//                        if hasValidLicense {
//                            let dict:[String:Any] = ["isSignInPathForUniversalLink":self.isSignInPathForUniversalLink, "code":self.sharedCode]
//                            NotificationCenter.default.post(name: Notification.Name(StringConstant.notificationStaticKeys.authorizationDidSucceed), object: nil, userInfo:dict)
//                            self.dismiss(animated: true, completion: nil)
//                        }else{
//                            self.errorLabel.text = StringConstant.errorMessage.InvalidCurrentLicense
//                        }
//                    }
                }
            }
        }
    }
    
    /// Action of the cancel button.
    /// - Parameter sender: Pass UIButton object
    @IBAction func actionCancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension LoginController: UITextFieldDelegate {
    
    /// This delegate method is used for hide the keyboard on return tapped.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            self.passwordTextField.becomeFirstResponder()
        }else if textField == passwordTextField {
            textField.resignFirstResponder()
        }
        return true
    }
}
