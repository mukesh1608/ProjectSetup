//
//  MessageAlert.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation
import CRNotifications

/// This class is used for showing the CRNotifications popup.
class MessageAlert {

    /// This function is showing the Success Alert.
    /// - Parameters:
    ///   - title: Passing alert title
    ///   - message: Passing alert message
    static func showSuccessAlert(title: String, message: String){
        CRNotifications.showNotification(type: CRNotifications.success, title: title, message: message, dismissDelay: 3, completion: {
            printLOG("Successfully executed this print when the notification disappeared.")
        })
    }
    
    /// This function is showing the Error Alert.
    /// - Parameters:
    ///   - title: Passing alert title
    ///   - message: Passing alert message
    static func showErrorAlert(title: String, message: String){
        CRNotifications.showNotification(type: CRNotifications.error, title: title, message: message, dismissDelay: 3)
    }
    
    /// This function is showing the Info Alert.
    /// - Parameters:
    ///   - title: Passing alert title
    ///   - message: Passing alert message
    static func showInfoAlert(title: String, message: String){
        CRNotifications.showNotification(type: CRNotifications.info, title: title, message: message, dismissDelay: 5)
    }
    
    /// This function is showing the Custom Alert.
    /// - Parameters:
    ///   - title: Passing alert title
    ///   - message: Passing alert message
    static func showCustomAlert(title: String, message: String){
        let customNotification = CustomCRNotification(textColor: UIColor.green, backgroundColor: UIColor.brown, image: UIImage())
        CRNotifications.showNotification(type: customNotification, title: title, message: message, dismissDelay: 3)
    }
    
    fileprivate struct CustomCRNotification: CRNotificationType {
        var textColor: UIColor
        var backgroundColor: UIColor
        var image: UIImage?
    }
}
