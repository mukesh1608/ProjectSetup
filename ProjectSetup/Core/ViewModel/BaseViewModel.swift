//
//  BaseViewModel.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This ViewModelProtocol is used for the view models.
protocol ViewModelProtocol {

}

/// This BaseViewModel class will inherited all view models.
class BaseViewModel: ViewModelProtocol {
    
    /// ErrorModel is used to keep all error informations.
    var errorModel: ErrorModel?

}
