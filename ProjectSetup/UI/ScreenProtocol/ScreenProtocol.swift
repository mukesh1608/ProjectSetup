//
//  ScreenProtocol.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This protocol is used to get State of  the controller. Use this in View controller.
protocol ScreenProtocol {
    
    /// Callback method when view controller on load.
    func configureOnLoad() -> Void
    
    /// Callback method when view controller after load.
    func configureAfterLoad() -> Void
    
}

/// This protocol is used to get State of  the controller. Use this in View controller.
extension ScreenProtocol {
    /// Callback method when view controller on appear.
    func configureOnAppear() { }
}
