//
//  ApiResponseModel.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This Model class is containing the Api Response.
class ApiResponseModel {
    
    /// Params
    var parameter = [String: Any]();
    
    init(json: JSONObject) {
        parameter["data"] = json
    }
}
