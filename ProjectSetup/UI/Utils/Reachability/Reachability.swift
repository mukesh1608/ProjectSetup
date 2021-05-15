//
//  Reachability.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation
import Alamofire

/// This class is used for checking the internet connection in our app.
public class Reachability {
    static let shared = Reachability()
    private init(){}
    
    /// This function check network is connected or not.
    /// - Returns: true and false
    public func isConnectedToNetwork() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }

}
