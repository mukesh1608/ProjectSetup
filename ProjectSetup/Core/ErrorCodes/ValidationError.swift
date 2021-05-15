//
//  ValidationError.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This have all the keys which has to passed in Validation Error.
///

/// - MissingRequiredField : MissingRequiredField errors

enum ValidationError: Error {
    case MissingRequiredField
}
