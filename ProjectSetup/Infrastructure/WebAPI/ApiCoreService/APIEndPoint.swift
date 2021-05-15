//
//  APIEndPoint.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This struct is used for Api end points.
struct APIEndPoint {
    
    /// For Account Information
    struct Account {
        static let Login    = "/sso/v1/motw";
        static let License   = "/loadLicensesForIOS";
    }
    
    /// For Share code Information
    struct ShareCode {
        static let ShareCode = "/share"
    }
    
    struct AppTracking {
        static let appTracking = "/authorize"
    }
}
