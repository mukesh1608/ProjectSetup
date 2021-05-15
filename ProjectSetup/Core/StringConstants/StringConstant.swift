//
//  StringConstant.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

public struct StringConstant {
    
    static let validationMsg = ValidationMessage();
    
    static let serverMsg = ServerMessage();
    static let notificationStaticKeys = NSNotificationStaticKeys();
    static let errorMessage = ErrorMessage();
    static let navigationStoryboardID = NavigationStoryboardID();
    static let freeManipulative = FreeManipulative();
    static let userDefaults = UserDefaultsKeys();
    static let message = Message();

}

struct Message {
    let ok_title                = "Ok"
    let settings_title          = "Settings"

    let info                    = "Information!"
    let alert_title             = "Error"
    let photos_alert_title      = "Cannot access Photos"
    let success                 = "Complete"
    let screenshotAdded         = "Screenshot added to Photos"
    let photosPermission        = "Please make sure Photos is turned on in Settings > Brainingcamp."
    let screenshotCopied        = "Copied to Clipboard!"
    let linkCopied              = "Copied to Clipboard!"
    let codeCopied              = "Copied to Clipboard!"
    
    let payloadNotFound         = "Payload not found"
    let sessionExpired          = "Your session has expired, please log in again to continue"

    let descriptionLinkCode     = "Users will need to be signed in to load Links or Share Codes.\nChanges by you or the people you share with can be shared with a new Link or Share Code"
}

struct NavigationStoryboardID {
    let ManipulatesDetailVC     = "ManipulativeDetailVC"
    let manipulativeCell        = "ManipulativeCell"
    let SignInVC                = "SignInVC"

}

struct UserDefaultsKeys {
    let LaunchCountKey = "launch_count"
}


struct ValidationMessage {
    let Error = "Error"
    let ValidationError = "Validation Error"
    let UserNameIsRequired = "UserName is required";
    let PasswordIsRequired = "Password is required";
    let RequestDataModelIsRequired = "Request data is required"
    let FreeManipulativeOfTheWeek = "Web subscribers please sign in. Otherwise enjoy the Free Manipulative of the Week"
    let LogoutMessage = "Are you sure you want to log out?"
    let Yes = "Yes"
    let Cancel = "Cancel"
    let Confirm = "Confirm"
    let ShareCodeLength = "Share code should be of 8 characters";
    let EmptyShareCode = "Please enter the share code";
    
}

struct FreeManipulative {
    let FreeThisWeek            = "Free This Week"
    let FreeNextWeek            = "Free Next Week"
}

struct ErrorMessage {
    let UserNameRequired        = "Username is required"
    let PasswordRequired        = "Password is required"
    let InvalidNamePassword     = "Invalid Username or Password"
    let InvalidCurrentLicense   = "Your licenses have expired."
    let InvalidToken            = "Invalid Token."
}

struct ServerMessage {
    
    let InvalidData             = "Invalid data";
    let HttpErrorMessage        = "Server HTTP Error: ";
    let DataNotAvailable        = "Response data not available."
    let defaultMsg              = "Something went wrong on server end. Please try again later."
    
    let ApiErrorTitle           = "Error";
    let InternetConnection      = "Please check your Internet connection"
}


struct NSNotificationStaticKeys {
    let authorizationDidSucceed     = "AuthorizationDidSucceed"
    let authorizationRevoked        = "AuthorizationRevoked"
    let shareCodeDidSucceed         = "ShareCodeDidSucceed"
    let openSignInController        = "OpenSignInController"
    let downloadImage               = "DownloadImage"
    let copyImage                   = "CopyImage"
    let linkCode                    = "LinkCode"
    let openShareCodePopUp          = "OpenShareCodePopUp"

    let openSignInControllerFromShareCode        = "OpenSignInControllerFromShareCode"
}

