//
//  ApiRequestModel.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

struct ApiRequestModel<T: Encodable> {
        
    /// WebService url endpoint
    let endPoint: String;
        
    /// HttpMethod: GET/POST/PUT
    let method: ApiHTTPMethod;
        
    /// Headers
    let headers: [String: String]?;
        
    /// Params: HTTPBody for POST or query param for GET
    let params: T
    
    var jsonParam:JSONObject? = nil
    
}
