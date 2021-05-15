//
//  ErrorModel.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This class is hold to keep all the error informations.
struct ErrorModel: ModelProtocol {
    
    /// Error Code:
    let code: ErrorCode;
    
    /// Error Descriptive message
    let message: String;

}
