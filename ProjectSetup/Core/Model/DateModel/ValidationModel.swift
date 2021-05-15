//
//  ValidationModel.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This model class is containing the parameters for validation.
struct ValidationModel<T> {
    let isValid: Bool;
    let message: String;
    let result: T?;
}
