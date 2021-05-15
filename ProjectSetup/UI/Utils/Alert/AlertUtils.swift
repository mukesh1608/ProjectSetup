//
//  AlertUtils.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import UIKit

typealias AlertCompletion = ((_ buttonTitle: String) -> (Void))?


class AlertUtils: NSObject {
    
    //Alert with Ok
    /// This class function is showing simple alert with one button.
    /// - Parameters:
    ///   - title: Alert Title
    ///   - message: Alert Message
    ///   - viewController: Passing controller reference
    ///   - completion: Callback when completion is done
    class func showOkAlert(title: String?, message: String?, viewController: UIViewController,completion:AlertCompletion) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            if(completion != nil) {
                completion!(title!)
            }
        }
        
        alertController.addAction(action)
        
        viewController.present(alertController, animated: true) {
            
        }
    }
    
    /// This class function is showing alert with OK and Settings button.
    /// - Parameters:
    ///   - title: Alert Title
    ///   - message: Alert Message
    ///   - noActionButtonTitle: Passing No action button title
    ///   - actionButtonTitle: Passing action button title
    ///   - completion: Callback when completion is done
    class func showOkAlertOnCustomClass(title: String?, message: String?,noActionButtonTitle:String, actionButtonTitle:String,completion:AlertCompletion) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title:noActionButtonTitle, style: .default) { (action) in
        }
        
        alertController.addAction(action)
        
        //Settings Button Action
        let settingsAction = UIAlertAction(title: actionButtonTitle, style: .default) { (action) in
            if(completion != nil) {
                completion!(title!)
            }
        }
        alertController.addAction(settingsAction)
        
        let controller = UIApplication.shared.windows[0].rootViewController
        
        if let presentController = controller {
            DispatchQueue.main.async {
                presentController.present(alertController, animated: true) {}
            }
        }
    }
    
        
    /// This class function is showing alert with two buttons.
    /// - Parameters:
    ///   - title: Alert Title
    ///   - message: Alert Message
    ///   - doneButton: Passing done button title
    ///   - cancelButton: Passing cancel button title
    ///   - viewController: Passing view controller reference
    ///   - completion: Callback when completion is done
    class func showAlert(title: String?, message: String?, doneButton: String?, cancelButton: String?, viewController: UIViewController, completion: AlertCompletion) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        //Cancel Button Action
        if cancelButton != nil {
            let action = UIAlertAction(title: cancelButton, style: .default) { (action) in
            }
            alertController.addAction(action)
        }
        
        //Done Button Action
        if doneButton != nil {
            let action = UIAlertAction(title: doneButton, style: .default) { (action) in
                if(completion != nil) {
                    completion!(doneButton!)
                }
            }
            alertController.addAction(action)
        }
        
        viewController.present(alertController, animated: true) {
        }
    }
    
    
    class func showAlert(title: String?, message: String?, actionTitles: [String], cancelTitle: String? = "Cancel", presentingController: UIViewController, completion: AlertCompletion) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for button in actionTitles {
            let action = UIAlertAction(title: button, style: .default) { (action) in
                if(completion != nil) {
                    completion!(button)
                }
            }
            alertController.addAction(action);
        }
        
        //Cancel Button
        if cancelTitle != nil {
            let actionCancel = UIAlertAction(title: cancelTitle!, style: .cancel) { (action) in
                if(completion != nil) {
                    completion!(cancelTitle!)
                }
            }
            alertController.addAction(actionCancel);
        }
        
        presentingController.present(alertController, animated: true, completion: nil);
        
    }
    
    class func alertUpdate(forNewVersion version: String!, withForce force: Bool, andAppStoreURL appStoreURL: String!, checkForceStatus: Bool, viewController: UIViewController, completion: AlertCompletion)
    {
        
        let alertController = UIAlertController(title: "New Version", message: version, preferredStyle: .alert)
        
        if !checkForceStatus
        {
            alertController.addAction(UIAlertAction(title: "Skip", style: UIAlertAction.Style.cancel, handler:{ (actionSheetController) -> Void in
                
            }))
        }
        
        //Add Update-Action
        alertController.addAction(UIAlertAction(title: "Update", style: UIAlertAction.Style.default, handler: { (actionSheetController) -> Void in
            if let appUrl = URL(string: appStoreURL)
            {
                UIApplication.shared.open(URL(string: "\(appUrl)")!)
            }
            
        }))
        
        viewController.present(alertController, animated: true, completion: nil);
        
    }
}




