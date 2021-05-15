//
//  LoginRequestModel.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This class is contain the login api request parameters.
struct LoginRequestModel: Encodable {
    
    /// Username
    let username: String;
    
    /// Password
    let password: String;

}
