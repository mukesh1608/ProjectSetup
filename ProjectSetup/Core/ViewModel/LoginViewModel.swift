//
//  LoginViewModel.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This View Model class is containing the logical methods of SignIn Screen.
class LoginViewModel: BaseViewModel {
    
    //These should be private
    var username: String? = nil;
    var password: String? = nil;
    
    var dataModel: LoginResponseModel? = nil;
    
    //MARK: SignIn Service
    func signIn(completion: @escaping (_ result: LoginResponseModel?, _ error: ErrorModel?) -> Void) {
        let service = LoginService();
        service.username = username;
        service.password = password;
        
        service.onSuccess = { (res) in
            self.dataModel = res;
            //Save Auth Data
//            Authorization.shared.save(auth: res.data.access_token);
//            let storage = UserStorage();
//            storage.saveUser(from: res);
            completion(res, nil);
        }
        
        service.onFailure = { (error) in
            printLOG(error);
            completion(nil, error);
        }
        service.request();
    }
    
    
    /// This function is checking the validation of the textfield.
    /// - Parameters:
    ///   - userName: userName
    ///   - password: password
    ///   - completion: error message
    /// - Returns: true or false
    func isValidTextField(userName:String, password:String, completion: @escaping(String)-> Void) -> Bool {
        if userName.count <= 0{
            completion(StringConstant.errorMessage.UserNameRequired)
            return false
        }else if password.count <= 0 {
            completion(StringConstant.errorMessage.PasswordRequired)
            return false
        }
        return true
    }
}
