//
//  LoginService.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This class is used for calling the Login Service Api.
class LoginService: BaseApiService <LoginRequestModel, LoginResponseModel> {
    
    var username: String!
    var password: String!
    
    
    /// This function  is used for End point
    /// - Returns: Return end point
    override func endPoint() -> String {
        return APIEndPoint.Account.Login;
    }
    
    /// This function  is used for HTTP Method
    /// - Returns: HTTP Method
    override func httpMethod() -> ApiHTTPMethod {
        return .POST;
    }
    
    
    /// This function  is used for Request Parameters
    /// - Returns: Request Parameters
    override func getRequestParams() -> LoginRequestModel? {
        return LoginRequestModel(username: username, password: password);
    }
    
    /// This function  is used for Request JSON
    /// - Returns: Nil
    override func getRequestJSON() -> JSONObject? {
        return nil
    }
    
    /// This function is used for convert the json object in Login Response Model.
    /// - Returns: Login Response Model
    override func convertToModel() -> LoginResponseModel? {
        let extra = self.response?.parameter;
        guard let extraDict = extra else {return nil}
        let dicModel = extraDict
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dicModel, options: .prettyPrinted);
            
            let decoder = JSONDecoder();
            let resultModel = try decoder.decode(LoginResponseModel.self, from: jsonData);
            
            return resultModel;
        } catch {
            printLOG("ERROR: \(error)");
        }
        return nil;
    }
}
