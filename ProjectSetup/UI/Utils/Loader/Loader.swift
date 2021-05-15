//
//  Loader.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation
import PKHUD


/// This class is used for Loader.
class Loader {
    
    static let shared = Loader();
    
    /// This function is showing the loader.
    /// - Parameters:
    ///   - title: Passing title
    ///   - subtitle: Passing sub title
    func show(title: String = "", subtitle: String = "Please wait...") {
        HUD.show(.labeledProgress(title: title, subtitle: subtitle));
    }
    
    /// This function is used for hide the loader.
    func hide()  {
        HUD.hide();
    }
    
    /// This function is used for hide the loader with success.
    func hideWithSuccess() {
        HUD.flash(.success);
    }
    
    /// This function is used for hide the loader with error.
    func hideWithError() {
        HUD.flash(.error);
    }
}
