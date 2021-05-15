
//
//  LoginResponseModel.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This Model class is containing the information of Login Response.
struct LoginResponseModel: Codable {
    
    /// This UserData containing the login information.
    let data:UserData

}

/// This Model class is containing the information of user data.
struct UserData:Codable {
    /// Token Type
    let token_type:String
    /// Access Token
    let access_token:String
    /// Expires In
    let expires_in:String
}
